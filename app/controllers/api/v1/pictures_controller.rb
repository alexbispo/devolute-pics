class Api::V1::PicturesController < ApplicationController

  def create
    picture_creation_service = PictureCreationService.new
    picture = picture_creation_service.add(current_user, picture_params)

    if picture.persisted?
      head :created
    else
      render json: picture.errors, status: :unprocessable_entity
    end
  end

  def index
    @pictures = PictureSearchingService.new.all_by_user(current_user)
  end

private

  def picture_params
    params.permit(:file)
  end
end

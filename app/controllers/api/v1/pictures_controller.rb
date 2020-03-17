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
    @pictures = current_user.pictures.with_attached_file
  end

private

  def picture_params
    params.permit(:file)
  end
end

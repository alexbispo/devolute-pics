class Api::V1::PicturesController < ApplicationController

  def create
    picture = Picture.new(picture_params)
    picture.user = current_user
    if picture.save
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

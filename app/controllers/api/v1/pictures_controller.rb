class Api::V1::PicturesController < ApplicationController

  def create
    picture = Picture.new(picture_params)
    picture.user = current_user
    if picture.save
      head 201
    else
      render json: picture.errors, status: :unprocessable_entity
    end
  end

  def index
    # links = current_user.pictures&.map { |p| url_for(p.file) }
    # render json: { links: links }, status: 200
    @pictures = current_user.pictures
  end

private

  def picture_params
    params.permit(:file)
  end
end

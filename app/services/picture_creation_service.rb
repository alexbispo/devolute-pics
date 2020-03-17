class PictureCreationService

  def add(user, picture_params)
    picture = Picture.new(picture_params)
    picture.user = user

    picture.save

    picture
  end
end

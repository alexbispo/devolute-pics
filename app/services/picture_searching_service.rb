class PictureSearchingService

  def all_by_user(user)
    user.pictures.with_attached_file
  end
end

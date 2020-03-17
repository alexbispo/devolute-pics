class UserRegisterService

  def register(user_params)
    User.create(user_params)
  end
end

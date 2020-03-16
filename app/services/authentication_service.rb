class AuthenticationService

  def authenticate(email, password)
    user = User.find_by(email: email)

    return user if user&.valid_password?(password)

    nil
  end
end

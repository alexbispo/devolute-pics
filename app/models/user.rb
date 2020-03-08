class User < ApplicationRecord
  has_secure_password

  def valid_password?(password)
    self.authenticate(password)
  end
end

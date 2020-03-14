class User < ApplicationRecord
  has_secure_password
  has_many :pictures

  def valid_password?(password)
    self.authenticate(password)
  end
end

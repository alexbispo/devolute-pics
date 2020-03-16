class User < ApplicationRecord
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password
  has_many :pictures

  validates :email, :username, presence: true, uniqueness: true

  validates :email, format: { with: EMAIL_REGEXP, message: 'invalid email' }

  validates :password, length: { in: 8..20 }

  validates :username, length: { in: 3..20 }

  def valid_password?(password)
    self.authenticate(password)
  end
end

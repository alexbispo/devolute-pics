class JsonWebToken

  JWT_KEY = ENV['JWT_KEY'] || Rails.application.secrets.secret_key_base

  def self.encode(payload)
    expiration = 30.minutes.from_now.to_i
    JWT.encode(payload.merge(exp: expiration),  JWT_KEY)
  end

  def self.decode(token)
    JWT.decode(token, JWT_KEY).first
  end
end

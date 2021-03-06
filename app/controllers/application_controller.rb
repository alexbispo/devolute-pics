class ApplicationController < ActionController::API
  before_action :set_defaullt_format
  before_action :authenticate_token!

  attr_reader :current_user

private

  def set_defaullt_format
    request.format = :json
  end

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload["id"])
  rescue JWT::ExpiredSignature
    render json: {errors: ["Auth token has expired"]}, status: :unauthorized
  rescue JWT::DecodeError
    render json: {errors: ["Invalid auth token"]}, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  end
end

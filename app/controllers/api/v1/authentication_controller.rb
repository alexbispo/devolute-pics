class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_token!

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: { token: JsonWebToken.encode(id: user.id, name: user.username) }
    else
      render json: { errors: ["Invalid email or password"] }, status: :unauthorized
    end
  end
end

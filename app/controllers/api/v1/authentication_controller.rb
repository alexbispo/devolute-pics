class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_token!

  def create
    auth_service = AuthenticationService.new
    authenticated_user = auth_service.authenticate(params[:email], params[:password])

    if authenticated_user
      render json: { token: JsonWebToken.encode(id: authenticated_user.id,
                     name: authenticated_user.username) }
    else
      render json: { errors: ["Invalid email or password"] }, status: :unauthorized
    end
  end
end

class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_token!, only: [:create]

  def create
    register_service = UserRegisterService.new
    user = register_service.register(user_params)

    if user.errors.empty?
      render( json: { userId: user.id,
                      userName: user.username,
                      userEmail: user.email }, status: :created)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

private

  def user_params
    params.permit(:username, :email, :password)
  end
end

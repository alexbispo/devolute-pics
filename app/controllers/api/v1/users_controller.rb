class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_token!, only: [:create]

  def create
    user = User.new(user_params)

    if user.save
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

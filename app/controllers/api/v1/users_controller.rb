class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      render( json: { userId: user.id,
                      userName: user.name,
                      userEmail: user.email }, status: :created)

    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end

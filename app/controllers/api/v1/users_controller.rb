class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.new(user_params)
      if user.save
        render json: user
      else
        render json: user.errors
      end
  end


  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end

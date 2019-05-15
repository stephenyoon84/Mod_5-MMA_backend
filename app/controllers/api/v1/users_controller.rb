class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      json = {token: token, success: true, user: user}
    else
      json = {errors: "something went wrong.", success: false}
    end
    render json: json
  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :gender, :dob, :register_date, :active, :info, :user_type, :password, :password_confirmation)
  end
end

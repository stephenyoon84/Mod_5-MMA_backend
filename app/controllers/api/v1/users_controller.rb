class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    dobA = user_params[:dob].split('/')
    bdate = Date.new(dobA[2].to_i, dobA[0].to_i, dobA[1].to_i)
    user.dob = bdate
    if user.save
      token = encode_token({user_id: user.id})
      json = {token: token, success: true, user: {id: user.id,
                                                  name: user.name,
                                                  email: user.email,
                                                  user_type: user.user_type}}
    else
      byebug
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

class Api::V1::UsersController < ApplicationController
  def index
    users = User.all.order('id DESC')
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      json = {token: token, success: true,
              user: {id: user.id,
                     name: user.name,
                     email: user.email,
                     phone_number: user.phone_number,
                     user_type: user.user_type}}
    else
      json = {errors: "something went wrong.", success: false}
    end
    render json: json
  end

  def update
    user = User.find(params[:id])
    new_info = user_params
    if user.authenticate(user_params[:password])
      if user.update(name: user_params[:name],
                  email: user_params[:email],
                  phone_number: user_params[:phone_number],
                  password: user_params[:new_password],
                  password_confirmation: user_params[:password_confirmation])
        json = {message: "Update success.", success: true}
      else
        json = {message: "Confirmation is not matching. Please check.", success: false}
      end
    elsif current_user.user_type == 'admin'
      user.update(user_type: user_params[:user_type])
      json = {message: "Type updated.", success: true}
    else
      json = {message: "Please check your password.", success: false}
    end
    render json: json
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :phone_number, :gender, :dob, :register_date, :active, :info, :user_type, :password, :password_confirmation, :new_password)
  end
end

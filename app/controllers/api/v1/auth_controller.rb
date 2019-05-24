class Api::V1::AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      json = {token: token, success: true,
        user: {id: user.id,
               name: user.name,
               email: user.email,
               user_type: user.user_type}}
    else
      json = {errors: "No matching email or password", success: false}
    end
    render json: json
  end

  def get_current_user
    if current_user
      json = {success: true,
              user: {id: current_user.id,
                     name: current_user.name,
                     email: current_user.email,
                     phone_number: current_user.phone_number,
                     user_type: current_user.user_type}}
    else
      json = {}
    end
    render json: json
  end
end

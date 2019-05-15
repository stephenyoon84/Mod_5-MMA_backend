class Api::V1::AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      json = {token: token, success: true, user: user}
    else
      json = {errors: "No matching email or password", success: false}
    end
    render json: json
  end
end

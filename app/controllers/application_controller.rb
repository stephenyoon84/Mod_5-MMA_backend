class ApplicationController < ActionController::API
  def encode_token(payload)
    token = JWT.encode(payload, get_secret)
  end

  def decode_token(token)
    payload = JWT.decode(token, get_secret)[0]
  end

  def get_secret
    # have to change when deploy
    return "Random String..It should be change"
  end

  def auth_header
    request.headers["Authorization"]
  end

  def header_token
    if auth_header.present?
      autho_header.split(' ')[1]
    end
  end

  def current_user
    if header_token.present?
      payload = decode_token(header_token)
      user = Usesr.find(payload['user_id'])
      user
    else
      false
    end
  end

  def authenticated
    if !current_user
      render json: {success: false, message: "Not Authorized"}, status: 401
    end
  end
end

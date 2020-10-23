class Api::V1::AuthenticationController < Api::ApiController
  include AuthHelper

  def login
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: auth_response(user), status: :ok
    else
      render json: {error: "Incorrect email or password"}, status: :unauthorized
    end
  end
end

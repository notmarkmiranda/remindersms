class Api::V1::AuthenticationController < Api::ApiController
  def login
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render_auth_response(user)
    else
      render json: {error: "Incorrect email or password"}, status: :unauthorized
    end
  end

  private

  def render_auth_response(user)
    expiration_time = Time.now + 30.hours.from_now.to_i

    render json: {
      token: user.token,
      expiration: expiration_time.iso8601,
      email: user.email
    }, status: :ok
  end
end

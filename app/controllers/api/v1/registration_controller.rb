class Api::V1::RegistrationController < Api::ApiController
  include AuthHelper

  def create
    user = User.new(user_params)
    if user.save
      render json: auth_response(user), status: :ok
    else
      render json: {error: user.errors.full_messages}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

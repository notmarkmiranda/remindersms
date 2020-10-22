class Api::ApiController < ApplicationController
  SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

  attr_reader :current_user

  def authenticate_api_request!
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    begin
      @current_user = find_user_by_jwt(token)
    rescue => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end

  private

  def find_user_by_jwt(token)
    decoded = HashWithIndifferentAccess.new(JWT.decode(token, SECRET_KEY)[0])
    user_id = decoded[:user_id]
    User.find(user_id)
  end
end

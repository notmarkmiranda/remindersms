module AuthHelper
  def auth_response(user)
    expiration_time = Time.now + 30.hours.from_now.to_i

    {
      token: user.token,
      expiration: expiration_time.iso8601,
      email: user.email
    }
  end
end

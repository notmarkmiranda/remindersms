module ApiHelper
  def get_as_user(user, path, **args)
    request_as_user(user, :get, path, **args)
  end

  def post_as_user(user, path, **args)
    request_as_user(user, :post, path, **args)
  end

  def put_as_user(user, path, **args)
    request_as_user(user, :put, path, **args)
  end

  def delete_as_user(user, path, **args)
    request_as_user(user, :delete, path, **args)
  end

  def request_as_user(user, method, path, params: nil, headers: {}, env: nil)
    token = access_token_for_user(user)
    headers["Authorization"] = "Bearer #{token}"

    process(method, path, params: params, headers: headers, env: env, as: :json)
  end

  def access_token_for_user(user, expiration = 24.hours.from_now)
    secret = ::Rails.application.credentials.secret_key_base.to_s
    payload = {}
    payload[:user_id] = user.id
    payload[:expiration] = expiration.to_i
    JWT.encode(payload, secret)
  end
end

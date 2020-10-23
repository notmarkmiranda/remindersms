require "rails_helper"

describe Api::V1::AuthenticationController, type: :request do
  describe "POST /api/v1/auth/login" do
    let(:user) { create(:user) }

    it "returns a token for credentials" do
      params = {
        email: user.email,
        password: "password"
      }

      post api_v1_auth_login_path, params: params, as: :json

      json_body = JSON.parse(response.body)
      expect(json_body.keys).to match_array %w[email token expiration]
      expect(json_body).to include({"email" => user.email})
    end
  end
end

require "rails_helper"

describe Api::V1::RegistrationController, type: :request do
  describe "POST /api/v1/registration" do
    let(:email_address) { "steamyweiners@markmiranda.email" }
    let(:params) { {user: {email: email_address, password: "password"}} }

    it "creates a user" do
      expect {
        post api_v1_registration_path, params: params, as: :json
      }.to change(User, :count).by(1)
    end

    it "returns a token" do
      post api_v1_registration_path, params: params, as: :json

      json_body = JSON.parse(response.body)
      expect(json_body.keys).to match_array %w[email token expiration]
      expect(json_body).to include({"email" => email_address})
    end
  end
end

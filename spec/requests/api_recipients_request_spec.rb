require "rails_helper"

describe Api::V1::RecipientsController, type: :request do
  let!(:recipient) { create(:recipient) }
  let(:user) { recipient.user }

  describe "GET#index" do
    it "returns an array for recipients" do
      get_as_user user, api_v1_recipients_path

      json_body = JSON.parse(response.body)
      expect(json_body).to eq([recipient].as_json)
    end
  end

  describe "GET#show" do
    it "returns a recipient" do
      get_as_user user, api_v1_recipient_path(id: recipient.id)

      json_body = JSON.parse(response.body)
      expect(json_body).to eq(recipient.as_json)
    end
  end

  describe "POST#create" do
    subject(:post_create) { post_as_user user, api_v1_recipients_path, params: params }

    let(:params) do
      {
        recipient: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone_number: "3035551212"
        }
      }
    end

    it "creates a recipient" do
      expect { post_create }.to change(Recipient, :count).by(1)
    end

    it "returns the recipient" do
      post_create

      json_body = JSON.parse(response.body)
      expect(json_body).to eq(Recipient.last.as_json)
    end
  end

  describe "PUT#update" do
    let(:old_name) { recipient.first_name }
    let(:new_name) { "Asdf" }
    let(:update_params) do
      {
        recipient: {
          first_name: new_name
        }
      }
    end

    it "updates a recipient" do
      expect(recipient.first_name).to eq(old_name)

      expect {
        put_as_user user, api_v1_recipient_path(id: recipient.id), params: update_params
      }.to change {
        recipient.reload
        recipient.first_name
      }
    end
  end

  describe "DELETE#destroy" do
    it "deletes a recipient" do
      expect {
        delete_as_user user, api_v1_recipient_path(id: recipient.id)
      }.to change(Recipient, :count).by(-1)
    end
  end
end

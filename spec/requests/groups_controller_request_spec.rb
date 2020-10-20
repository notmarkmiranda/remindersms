require "rails_helper"

describe GroupsController, type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe "GET#new" do
    subject(:get_new) { get "/groups/new" }

    it "should have 200 status" do
      get_new

      expect(response).to have_http_status(200)
    end
  end
end

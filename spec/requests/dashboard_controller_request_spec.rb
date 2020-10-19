require "rails_helper"

describe DashboardController, type: :request do
  describe "GET#show" do
    let(:user) { create(:user) }
    before { sign_in(user) }

    subject(:get_show) { get "/dashboard" }

    it "has 200 status" do
      get_show

      expect(response).to have_http_status(200)
    end
  end
end

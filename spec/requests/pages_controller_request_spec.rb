require "rails_helper"

describe PagesController, type: :request do
  describe "GET#home" do
    subject(:get_home) { get "/" }

    it "has 200 status" do
      get_home

      expect(response).to have_http_status(200)
    end
  end
end

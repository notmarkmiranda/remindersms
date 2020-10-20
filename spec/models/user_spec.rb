require "rails_helper"

describe User, type: :model do
  describe "validations" do
    before { create(:user) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe "relationships" do
    it { should have_many :groups }
  end
  describe "methods"
end

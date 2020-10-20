require "rails_helper"

describe Group, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations" do
    before { create(:group) }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "methods"
end

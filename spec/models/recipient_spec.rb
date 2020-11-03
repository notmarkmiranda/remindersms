require "rails_helper"

describe Recipient, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations"

  describe "methods"
end

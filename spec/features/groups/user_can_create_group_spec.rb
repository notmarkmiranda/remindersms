require "rails_helper"

describe "User can create a group", type: :feature do
  let(:user) { create(:user) }
  let(:group_name) { "Super Duper" }
  before { login_as(user) }

  it "allows a user that is logged in to create group" do
    visit new_group_path

    fill_in "Group Name", with: group_name
    click_button "Create Group!"

    expect(current_path).to eq(group_path(Group.last))
    expect(page).to have_content(group_name)
    expect(page).to have_link("Add recipients")
  end
end

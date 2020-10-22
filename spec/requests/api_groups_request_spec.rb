require "rails_helper"

describe Api::V1::GroupsController, type: :request do
  let(:user) { create(:user) }
  let!(:groups) { create_list(:group, 2, user: user) }
  let!(:other_group) { create(:group) }

  describe "GET#index" do
    it "returns an array of groups" do
      get_as_user user, api_v1_groups_path
      json = JSON.parse(response.body)

      expect(json).to eq(user.groups.as_json)
      expect(json).not_to include(other_group)
    end
  end

  describe "GET#show" do
    it "returns a single group" do
      get_as_user user, api_v1_group_path(id: groups[0].id)
      json = JSON.parse(response.body)

      expect(json).to eq(groups[0].as_json)
    end
  end

  describe "POST#create" do
    it "creates a group" do
      expect {
        post_as_user user, api_v1_groups_path, params: {group: attributes_for(:group)}
      }.to change(Group, :count).by(1)
    end

    it "returns the created group" do
      post_as_user user, api_v1_groups_path, params: {group: attributes_for(:group)}
      json = JSON.parse(response.body)

      expect(json).to eq(Group.last.as_json)
    end
  end

  describe "PUT#update" do
    let(:new_name) { "super duper" }
    it "updates a group" do
      put_as_user user, api_v1_group_path(id: groups[0].id), params: {group: {name: new_name}}
      json = JSON.parse(response.body)

      expect(json["name"]).to eq(new_name)
    end
  end

  describe "DELETE#destroy" do
    it "deletes a group" do
      expect {
        delete_as_user user, api_v1_group_path(id: groups[0].id)
      }.to change(Group, :count).by(-1)
    end

    it "has head no_content status" do
      delete_as_user user, api_v1_group_path(id: groups[0].id)

      expect(response).to have_http_status(204)
    end

    describe "for a user that doesn't own the group" do
      it "does not delete a group" do
        expect {
          delete_as_user user, api_v1_group_path(id: other_group.id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe "for a visitor" do
      it "does not delete a group" do
        delete api_v1_group_path(id: groups[0].id)
        json = JSON.parse(response.body)

        expect(json).to eq({"errors" => "Nil JSON web token"})
        expect(response).to have_http_status(401)
      end
    end
  end
end

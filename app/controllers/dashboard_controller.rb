class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @groups = current_user.groups
  end
end

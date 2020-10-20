class GroupsController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = current_user.groups.find(params[:id])
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

class Api::V1::GroupsController < Api::ApiController
  before_action :authenticate_api_request!
  before_action :set_group, only: [:show, :update, :destroy]

  def index
    render json: current_user.groups
  end

  def show
    render json: @group
  end

  def create
    group = current_user.groups.new(group_params)
    if group.save
      render json: group
    else
      render json: {errors: @group.errors.full_messages}
    end
  end

  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: {errors: @group.errors.full_messages}
    end
  end

  def destroy
    @group.destroy
    head :no_content
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

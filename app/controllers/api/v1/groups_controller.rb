class Api::V1::GroupsController < Api::ApiController
  before_action :authenticate_api_request!

  def index
    render json: current_user.groups
  end

  def show
    render json: current_user.groups.find(params[:id])
  end

  def create
    group = current_user.groups.new(group_params)
    if group.save
      render json: group
    else
      render json: {errors: errors.full_messages}
    end
  end

  def update
    group = current_user.groups.find(params[:id])
    if group.update(group_params)
      render json: group
    else
      render json: {errors: errors.full_messages}
    end
  end

  def destroy
    group = current_user.groups.find(params[:id])
    group.destroy
    head :no_content
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

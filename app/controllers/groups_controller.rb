class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end

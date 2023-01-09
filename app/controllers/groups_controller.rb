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
    if @group.save
    #   format.html {
    #     redirect_to @group, notice: 'Group was succesfully created.'
    #   }
      redirect_to @group, notice: 'Group was succesfully created.'
    else
      render "new", status: :unprocessable_entity
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

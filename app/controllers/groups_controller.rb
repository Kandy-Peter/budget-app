class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @groups = current_user.groups.all.order(created_at: :desc)
    @entities = current_user.entities.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      flash[:success] = 'Transaction created successfully'
      redirect_to groups_path, notice: 'Succefully added!'
    else
      flash.now[:error] = 'Group not saved, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

class EntitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @group = Group.find_by(id: params[:group_id])
    @entities = Entity.where(group_id: @group.id)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id

    if @entity.save
      flash[:success] = 'Transaction created successfully'
      redirect_to group_entities_path, notice: 'Succefully added!'
    else
      flash.now[:error] = 'Entity not saved, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entity_params
    params.permit(:name, :amount, :group_id)
  end
end

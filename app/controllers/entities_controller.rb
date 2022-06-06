class EntitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @entities = current_user.entities.all.order(created_at: :desc)
    @group = Group.find_by(id: params[:group_id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)

    if @entity.save
      flash[:success] = 'Transaction created successfully'
      render :show, notice: "Succefully added!"
    else
      flash.now[:error] = 'Entity not saved, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end

class EntitiesController < ApplicationController
  load_and_authorize_resource
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index; end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  def show
    @entity.
  end  

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity.groups.first, notice: 'Spense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id, group_ids: [])
  end
end

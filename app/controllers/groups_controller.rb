class GroupsController < ApplicationController
  load_and_authorize_resource
  # skip_authorization_check only: %i[invalid_site new]
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = []
    @groups = Group.where(user_id: current_user.id)
    @icons = icons
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find_by(id: params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
    @icons = icons
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    
    @group = Group.new(name: group_params[:name], icon: params[:icon])
    @group.user_id = current_user.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end

  def icons
    [
      'https://i.imgur.com/HAZNFh4.png',
      'https://i.imgur.com/XUwZ2fZ.png',
      'https://i.imgur.com/8eetEOP.png',
      'https://i.imgur.com/GL7vDfv.png',
      'https://i.imgur.com/GY1ASX0.png',
      'https://i.imgur.com/FPpOGrL.png',
      'https://i.imgur.com/7fs7B7v.png?1',
      'https://i.imgur.com/YVIC50Q.png'
    ]
  end
end

class BuildingdetailsController < ApplicationController
  before_action :set_building_detail, only: [:show, :edit, :update, :destroy]

  # GET /building_details
  # GET /building_details.json
  def index
    @buildingdetails = Buildingdetail.all
  end

  # GET /building_details/1
  # GET /building_details/1.json
  def show
  end

  # GET /building_details/new
  def new
    @buildingdetail = Buildingdetail.new
  end

  # GET /building_details/1/edit
  def edit
  end

  # POST /building_details
  # POST /building_details.json
  def create
    @buildingdetail = Buildingdetail.new(buildingdetail_params)

    respond_to do |format|
      if @buildingdetail.save
        format.html { redirect_to @buildingdetail, notice: 'Building detail was successfully created.' }
        format.json { render :show, status: :created, location: @buildingdetail }
      else
        format.html { render :new }
        format.json { render json: @buildingdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_details/1
  # PATCH/PUT /building_details/1.json
  def update
    respond_to do |format|
      if @building_detail.update(buildingdetail_params)
        format.html { redirect_to @buildingdetail, notice: 'Building detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @buildingdetail }
      else
        format.html { render :edit }
        format.json { render json: @buildingdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_details/1
  # DELETE /building_details/1.json
  def destroy
    @buildingdetail.destroy
    respond_to do |format|
      format.html { redirect_to buildingdetails_url, notice: 'Building detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_detail
      @buildingdetail = Buildingdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_detail_params
      params.fetch(:buildingdetail, {})
    end
end

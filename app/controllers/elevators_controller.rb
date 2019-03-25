class ElevatorsController < ApplicationController
  before_action :set_elevator, only: [:show, :edit, :update, :destroy]

  # GET /elevators
  # GET /elevators.json
  def index
    @elevators = Elevator.all
  end

  # GET /elevators/1
  # GET /elevators/1.json
  def show
  end

  # GET /elevators/new
  def new
    @elevator = Elevator.new
  end

  # GET /elevators/1/edit
  def edit
  end

  # POST /elevators
  # POST /elevators.json
  def create
    @elevator = Elevator.new(elevator_params)

    respond_to do |format|
      if @elevator.save
        format.html { redirect_to @elevator, notice: 'Elevator was successfully created.' }
        format.json { render :show, status: :created, location: @elevator }
      else
        format.html { render :new }
        format.json { render json: @elevator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elevators/1
  # PATCH/PUT /elevators/1.json
  def update
    respond_to do |format|
      if @elevator.update(elevator_params)
        format.html { redirect_to @elevator, notice: 'Elevator was successfully updated.' }
        format.json { render :show, status: :ok, location: @elevator }
      else
        format.html { render :edit }
        format.json { render json: @elevator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elevators/1
  # DELETE /elevators/1.json
  def destroy
    @elevator.destroy
    respond_to do |format|
      format.html { redirect_to elevators_url, notice: 'Elevator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elevator
      @elevator = Elevator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elevator_params
      params.fetch(:elevator, {})
    end
end

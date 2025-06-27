class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @flights = Flight.current_day.ordered_by_std
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy!

    respond_to do |format|
      format.html { redirect_to flights_path, status: :see_other, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      permitted_params = params.require(:flight).permit(:std_time, :std_datetime, :etd_time, :etd_datetime, :airline, :flight_no, :destination, :gate, :status)
      
      # Convert time fields to datetime if they exist
      if permitted_params[:std_time].present?
        time = Time.parse(permitted_params[:std_time])
        permitted_params[:std] = Time.current.change(hour: time.hour, min: time.min)
        permitted_params.delete(:std_time)
        permitted_params.delete(:std_datetime)
      elsif permitted_params[:std_datetime].present?
        permitted_params[:std] = permitted_params[:std_datetime]
        permitted_params.delete(:std_time)
        permitted_params.delete(:std_datetime)
      end
      
      if permitted_params[:etd_time].present?
        time = Time.parse(permitted_params[:etd_time])
        permitted_params[:etd] = Time.current.change(hour: time.hour, min: time.min)
        permitted_params.delete(:etd_time)
        permitted_params.delete(:etd_datetime)
      elsif permitted_params[:etd_datetime].present?
        permitted_params[:etd] = permitted_params[:etd_datetime]
        permitted_params.delete(:etd_time)
        permitted_params.delete(:etd_datetime)
      end
      
      permitted_params
    end
end

class PlacesController < ApplicationController
  layout "left_menu"
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @trip = Trip.find(params[:trip_id])
    @places = @trip.places.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @trip = Trip.find(params[:trip_id])
    @place = @trip.places.find(params[:id])
  end

  # GET /places/new
  def new
    @place = Place.new
    @trip = Trip.find(params[:trip_id])
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @trip = Trip.find(params[:trip_id])
    @place = @trip.places.create(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to trip_places_path, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @trip = Trip.find(params[:trip_id])
    @place = @trip.places.find(params[:id])
    @place.destroy
    redirect_to trip_places_path(@trip)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :latitude, :longitude)
    end
end

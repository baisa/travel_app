class TripsController < ApplicationController
  
  def index
    @trips = Trip.all
    #dostep do wszytskich tripow uzytkownika
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(params.require(:trip).permit(:title, :description))
    @trip.save
    redirect_to @trip
  end
end

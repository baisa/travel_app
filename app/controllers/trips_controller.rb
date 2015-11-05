class TripsController < ApplicationController

  def index
    @trips = Trip.all
    #dostep do wszytskich tripow uzytkownika
  end

  def show
    @trip = Trip.find(params[:id])
    @elems = [
      { name: "People", url: trip_participants_path(@trip), icon: "fa-users" },
      { name: "Todo before trip", url: trip_todos_path(@trip), icon: "fa-list-ol" },
      { name: "Journey map", url: trip_documents_path(@trip), icon: "fa-globe" },
      { name: "Plan and ideas", url: trip_documents_path(@trip), icon: "fa-calendar" },
      { name: "Documents", url: trip_documents_path(@trip), icon: "fa-file-text-o" },
      { name: "Costs", url: trip_costs_path(@trip), icon: "fa-dollar" },
    ]
  end

  def new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
     redirect_to @trip
   else
      render 'new'
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :description)
  end
end

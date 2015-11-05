class CostsController < ApplicationController
  layout "left_menu"
  
  def index
    @trip = Trip.find(params[:trip_id])
    @costs = @trip.costs.all
    @cost = Cost.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @cost = @trip.costs.create(cost_params)
    redirect_to trip_costs_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @cost = @trip.costs.find(params[:id])
    @cost.destroy
    redirect_to trip_costs_path(@trip)
  end

  private
    def cost_params
      params.require(:cost).permit(:title, :amount)
    end

end

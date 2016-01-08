class IdeasController < ApplicationController
  layout "left_menu"
  
  def index
    @trip = Trip.find(params[:trip_id])
    @ideas = @trip.ideas.all
    @idea = Idea.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @idea = @trip.ideas.create(idea_params)
    redirect_to trip_ideas_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @idea = @trip.ideas.find(params[:id])
    @idea.destroy
    redirect_to trip_ideas_path(@trip)
  end

  private
    def idea_params
      params.require(:idea).permit(:idea, :planned_at)
    end

end

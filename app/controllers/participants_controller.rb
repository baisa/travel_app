class ParticipantsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @participants = @trip.participants.all
    @participant = Participant.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @participant = @trip.participants.create(participant_params)
    
    @todo = Todo.new
    @todo.participants << @participant
    redirect_to trip_participants_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @participant = @trip.participants.find(params[:id])
    @participant.destroy
    redirect_to trip_participants_path(@trip)
  end

  private
    def participant_params
      params.require(:participant).permit(:name)
    end

end

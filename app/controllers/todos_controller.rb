class TodosController < ApplicationController
  layout "left_menu"
  
  def index
    @trip = Trip.find(params[:trip_id])
    @todos = @trip.todos.all
    @todo = Todo.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @todo = @trip.todos.create(todo_params)
    @todo.participant_ids = params[:participants]
    redirect_to trip_todos_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @todo = @trip.todos.find(params[:id])
    @todo.destroy
    redirect_to trip_todos_path(@trip)
  end

  private
    def todo_params
      params.require(:todo).permit(:task, :participants => [])
    end

end

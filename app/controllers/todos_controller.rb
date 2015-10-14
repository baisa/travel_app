class TodosController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @todos = @trip.todos.all
    @todo = Todo.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @todo = @trip.todos.create(todo_params)
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
      params.require(:todo).permit(:task)
    end

end

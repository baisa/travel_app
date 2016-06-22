class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter do
    puts "We are in #{params[:controller]}.#{params[:action]}"
  end

  # block access to non user resources
  before_filter do
    trips_controllers = ["documents", "costs", "trips", "todos"]
   # byebug
    if trips_controllers.include?(params[:controller]) && !current_user && params[:trip_id] && !current_user.trip_ids.include?(params[:trip_id])
      flash[:notice] = "You are not allowed to access this page"
      redirect_to :root
    end
  end

private

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end
  helper_method :current_user

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter do
    puts "We are in #{params[:controller]}.#{params[:action]}"
  end

  before_filter do
    trips_controllers = ["documents", "costs", "trips", "todos"]
    if trips_controllers.include?(params[:controller]) && !current_user
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

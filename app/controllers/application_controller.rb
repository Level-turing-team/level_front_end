class ApplicationController < ActionController::Base
  helper_method :current_user, :authorized, :logged_in
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(google_id: session[:user_id]) if session[:user_id]
  end

  def authorized
    redirect_to root_path if logged_in == false
  end

  def logged_in
    !!current_user
  end
end

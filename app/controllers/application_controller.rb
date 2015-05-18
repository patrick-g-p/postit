class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      no_access
    end
  end

  def require_admin
    unless logged_in? && current_user.admin?
      no_access
    end
  end

  def no_access
    flash[:error] = "You need to be logged in to do that action."
    redirect_to root_path
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def log_in_user!
    session[:session_token] = @user.reset_session_token!
    redirect_to root_url
  end

  def logged_in?
    !!current_user
  end

  def user_is_logged_in
    redirect_to root_url if logged_in?
  end
end

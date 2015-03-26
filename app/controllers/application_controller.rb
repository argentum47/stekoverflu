class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def logged_in?
    true if current_user
  end

  def is_current_user?
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, flash: { error: "Access Denied" }
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to root_url, flash: { error: "You Need to SignIn" }
    end
  end

end

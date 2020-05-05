class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_login, except: [:home]

  def logged_in?
    !!current_user
  end

  def home
    if logged_in?
      redirect_to user_path(@current_user)
    end
  end

  private

  def require_login
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end

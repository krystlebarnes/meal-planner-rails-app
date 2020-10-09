class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if params[:provider] == 'google_oauth2' && @user = User.find_by(email: auth['info']['email']) #checks to see if logging in using oauth and has logged in before
      session[:user_id] = @user.id
      redirect_to recipes_path

    elsif params[:provider] == 'google_oauth2'
      session[:omniauth] = auth.except('extra')
      redirect_to signup_path
  
    else 
      @user = User.find_by(username: params[:user][:username]) 
      
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to recipes_path
      else
        flash[:error] = "Login failed. Please try again."
        redirect_to login_path
      end

    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

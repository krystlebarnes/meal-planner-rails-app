class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    # if logged_in?
    #   # Means our user is signed in. Add the authorization to the user if the authoirization doesn't already exist.
    #   @current_user.add_provider(auth)
    #
    # elsif authorization = Authorization.find_by(provider: auth["provider"], uid: auth["uid"])
    #   # Means user already exists
    #   @user = authorization.user
    #   redirect_to user_path(@user)
    #
    # else
    #   # Means the user is new and signing in for the first time using a third-party provider.
    #   # Save omniauth params in a session cookie and redirect to new user form to finish registration.
    #     session[:omniauth] = auth.except('extra')
    #     redirect_to new_user_path
    # end
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Login failed. Please try again."
      redirect_to login_path
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

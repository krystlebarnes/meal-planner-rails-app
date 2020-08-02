class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new

    #Pass omniauth params to the new user form fields when a user uses omniauth to create new account.
    if @auth = session[:omniauth]
      @name = @auth['info']['name']
      @email = @auth['info']['email']
      @password = SecureRandom.hex
    end

  end

  def create
    @user = User.new(user_params)

    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      session.delete :omniauth  if session[:omniauth]
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    @message = params[:message] if params[:message]
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

end

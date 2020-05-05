class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new

    #Pass omniauth params to the new user form fields when a user uses omniauth to create new account.
    if auth = session[:omniauth]
      @name = auth["info"]["name"]
      @email = auth["info"]["email"]
      @provider = auth["provider"]
      @uid = auth["uid"]
    end

  end

  def create
    @user = User.new(user_params)

    # if @user.save
    #   session[:user_id] = @user.id
    #   #Add authorization to user if omniauth is used to create the account.
    #   @user.add_provider(auth) if auth = session[:omniauth]
    #   redirect_to user_path(@user)
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
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

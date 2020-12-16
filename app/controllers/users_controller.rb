class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def login
    @user = User.new
  end

  def create_session
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/users'
    else
      redirect_to '/signup'
    end
  end


  def create
    user = User.new(user_params)
      if user.password == user.password_confirmation
        user.save
        session[:user_id] = user.id
        redirect_to '/users'
      else
        redirect_to '/signup', notice: "You did it wrong, asshole. Try again."
      end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :username, :name)
    end
  
  end

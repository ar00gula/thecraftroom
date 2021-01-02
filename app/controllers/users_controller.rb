class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show, :destroy]

  def index
    @users = User.all
    @user = User.find_by(id: session[:user_id])
  end

  def signup
    @user = User.new
  end

  def login
    @user = User.new
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def create_session
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/signup'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to '/users'
    else
        render :signup, notice: "You did it wrong, asshole. Try again."
    end
  end

  def create_facebook
    #currently broken bc i'm not sure if i'm supposed to make another class or what? but the basic functionality seems to be going
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    byebug

    session[:user_id] = @user.id

    render :show
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :username, :name)
  end

  def auth
    request.env['omniauth.auth']
  end

end

class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show, :destroy]
  before_action :no_double_dipping, only: [:signup, :login]

  def index
    @users = User.all
    @user = User.find_by(id: session[:user_id])
  
  unless current_user.id == 1
     redirect_to '/home'
    end
  end

  def signup
    @user = User.new
    render :layout => "homepage"
  end

  def login
    @user = User.new
    render :layout => "homepage"
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @craft_categories = CraftCategory.all
  end

  def create_session
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      @message = "There is a problem with the username or password."
      render :login, :layout=> "homepage"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to '/home'
    else
        render :signup, :layout => "homepage"
    end
  end

  def create_facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.urlsafe_base64
      u.password_confirmation = u.password
      
      username = auth['info']['name'].split(" ").join
      if User.find_by(username: username)
        i = 0
        until !User.find_by(username: :username)
          username = username + i
          i += 1
        end
      end
      u.username = username

    end

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

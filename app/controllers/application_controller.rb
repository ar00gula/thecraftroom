class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :no_double_dipping
    before_action :no_double_dipping, only: :homepage

    def homepage # should go in a static controller
        render :layout => "homepage"
    end

    def leaderboard
        @users = User.all

    end

    def current_user
        User.find_by_id(session[:user_id])
    end

    def logged_in?
        if current_user
        else
          redirect_to '/signup'
          #ADD FLASH MESSAGE HERE
        end
    end

    def no_double_dipping
        if current_user
          redirect_to '/home'
        end
    end

end

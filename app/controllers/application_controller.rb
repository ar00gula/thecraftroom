class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def homepage
        render :layout => "homepage"
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

end

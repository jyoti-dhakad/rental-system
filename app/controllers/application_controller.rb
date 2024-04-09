class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        if cookies[:user_id].present?
          @current_user ||= User.find_by(id: cookies[:user_id])
        end
    end
    def logged_in?
    !!current_user
    end
end

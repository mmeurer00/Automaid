module ApplicationHelper
    def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id].present?
    end

    def logged_in?
        !!current_user
    end
end

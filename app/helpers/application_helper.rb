module ApplicationHelper
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
    end

    def logged_in?
        !!current_user
    end

    def time_options
        @times = ["5:00 am","6:00 am", "7:00 am", "8:00 am","9:00 am","10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm", "6:00 pm", "7:00 pm", "8:00 pm", "9:00 pm", "10:00 pm", "11:00 pm", "12:00 am"]
    end
end



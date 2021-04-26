class SessionsController < ApplicationController
    
    #Logging in
    def new
    end

    def create
        if user = User.find_by!(email: user_params[:email])
            if !!user && user.authenticate(user_params[:password])
                session[:user_id] = @user_id
                redirect_to user_devices_path
            else
                render :new
            end
        else 
            render :new
        end
    end
    
    #Logging out
    def logout
        if logged_in?
            session[:user_id] = []
            redirect_to login_path
        else
            redirect_to user_devices_path
        end
    end


    def omniauth
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :user_id)
    end

end
class SessionsController < ApplicationController
    
    #Logging in
    def new
    end

    def create
        @user = User.find_by(params[:email])
            if !!@user && @user.authenticate(user_params)
                session[:user_id] = @user.id
                redirect_to rooms_path
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
            redirect_to rooms_path
        end
    end


    def omniauth
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :user_id)
    end

end
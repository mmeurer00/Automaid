class SessionsController < ApplicationController

    def new
    end

    def create
        if user = User.find_by!(email: user_params[:email])
            if !!user && user.authenticate(user_params[:password])
                session[:user_id] = @user_id
                redirect_to users_path
            else
                render :new
            end
        else 
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end


    def omniauth
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :user_id)
    end

end
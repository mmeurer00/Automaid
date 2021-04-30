class SessionsController < ApplicationController
    
    #Logging in
    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
            if !!@user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to rooms_path
            else
                flash.now[:notice] = "Email or password is incorrect."
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
        #binding.pry
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
            u.name = request.env['omniauth.auth'][:info][:first_name]
            u.email = request.env['omniauth.auth'][:info][:email]
            u.password = SecureRandom.hex(10)
        end
        
        if user.valid?
            session[:user_id] = user.id
            redirect_to rooms_path
        else
            redirect_to login_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :user_id, :name)
    end

end
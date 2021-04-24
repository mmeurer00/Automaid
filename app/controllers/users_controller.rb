class UsersController < ApplicationController

    #signing up
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render :new
        end
    end

    def index
        User.all
        #binding.pry
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password )
    end
end
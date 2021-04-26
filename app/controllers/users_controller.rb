class UsersController < ApplicationController

    #signing up
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_devices_path
        else
            render :new
        end
    end

    def index
        @users = User.all
    end

    def user_devices_index
        @user = User.find(params[:id])
        @user_devices = @user.user_devices
        render template: 'user_devices/index'
    end

    def user_device
        @user = User.find(params[:id])
        @user_device = UserDevice.find(params[:user_device_id])
        render template: 'user_devices/show'
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password )
    end
end
class UserDevicesController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    
    def index
        @user_devices = UserDevice.all
    end

    def show
        @user_device = UserDevice.find(params[:id])
    end

    def new
        @user_device = UserDevice.new
    end

    def create
        @user_device = UserDevice.new(user_device_params)
        if @user_device.save
            redirect_to user_device_path(@user_device)
        else
            render :new
        end
    end

    def edit
        @user_device = UserDevice.find(params[:id])
    end
    
    def update 
        @user_device = UserDevice.find(params[:id])
        @user_device.update(user_device_params)
        if @user_device.valid?
            redirect_to user_devices_path
        else
            render :edit
        end
    end

    def destroy
        @user_device = UserDevice.find(params[:id])
        @user_device.destroy
        redirect_to user_devices_path
    end

    private

    def user_device_params
        params.require(:user_device).permit(:location, :indoor, :outdoor, :quantity, :user_id)
    end

end
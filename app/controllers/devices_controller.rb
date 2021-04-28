class DevicesController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    def index
        @devices = Device.all
    end

    def show
        @device = Device.find_by(id: params[:id])
    end

    def new
        @device = Device.new
        @user = current_user
    end

    def create
        @device = Device.new(device_params)
        @device.user = current_user
        if @device.save!
            redirect_to device_path(@device)
        else
            render :new
        end
    end

    def edit
        @device = Device.find_by(id: params[:id])
    end

    def update 
        @device = Device.find_by(id: params[:id])
        @device.update(device_params)

        if @device.valid?
            redirect_to device_path(@device)
        else 
            render :edit
        end
    end

    def destroy
        @device = Device.find_by(id: params[:id])
        @device.destroy
        redirect_to devices_path
    end

    private

    def device_params
        params.require(:device).permit(:name, :brand, :type, :model, :description, :quantity, :user_id)
    end

end
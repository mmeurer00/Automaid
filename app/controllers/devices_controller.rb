class DevicesController < ApplicationController
    
    def index
        @devices = Device.all
    end

    def show
        @device = Device.find_by(id: params[:id])
    end

    def new
        @device = Device.new
    end

    def create
        @device = Device.new(device_params)
        if @device.save
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
        params.require(:device).permit(:name, :brand, :type, :description, :user_device_id, :automation_id)
    end

end
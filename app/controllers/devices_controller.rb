class DevicesController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    
    def search
        @devices = current_user.devices.search(params[:device])
        render :index
    end

    def order_by_quantity
        @devices = Device.all.order(quantity: :desc)
        
    end

    
    def index
        @devices = current_user.devices
    end

    def show
        @device = current_user.devices.find(params[:id])
    end

    def new
        @device = current_user.devices.build
    end

    def create
    
        @device = current_user.devices.build(device_params)
        if @device.save!
            redirect_to device_path(@device)
        else
            flash.now[:notice] = "Device DID NOT save: "
            render :new
        end
    end

    def edit
        @device = current_user.devices.find(params[:id])
    end

    def update 
        @device = current_user.devices.find(params[:id])
        @device.update(device_params)

        if @device.valid?
            redirect_to device_path(@device)
        else 
            render :edit
        end
    end

    def destroy
        @device = current_user.devices.find(params[:id])
        @device.destroy
        redirect_to devices_path
    end

    private

    def device_params
        params.require(:device).permit(:name, :brand, :type, :model, :description, :quantity, :user_id)
    end

end
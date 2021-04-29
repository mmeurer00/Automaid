class AutomationsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    def new
        device = current_user.devices.find_by(id: params[:device_id])
        @automation = device.automations.build
        #@automation.device = Device.find_by(id: params[:device_id])
    end

    def create
        device = current_user.devices.find_by(id: params[:device_id])
        @automation = device.automations.new(automation_params)
        @automation.device = Device.find_by(id: params[:device_id])
        if @automation.save! 
            redirect_to device_automation_path(@automation.device, @automation)
        else
            redirect_to new_device_automation_path
        end
    end

    def index
        @device = current_user.devices.find_by(id: params[:device_id])
        device = current_user.devices.find_by(id: params[:device_id])
        @automations = device.automations.all
    end

    def all
        @automations = current_user.automations.all
    end

    def show
        @device = current_user.devices.find_by(id: params[:device_id])
        device = current_user.devices.find_by(id: params[:device_id])
        @automation = device.automations.find_by(id: params[:id])
        #@automation.device = Device.find_by(id: params[:device_id])
    end

    def edit
        @automation = current_user.automations.find(params[:id])
        @automation.device = Device.find_by(id: params[:device_id])
    end

    def update 
        @automation = current_user.automations.find(params[:id])
        @automation.update(automation_params)
        @automation.device = Device.find_by(id: params[:device_id])

        if @automation.valid?
            redirect_to edit_device_automation_path(@automation)
        else
            render :edit
        end
    end

    def destroy
        @automation = current_user.automations.find(params[:id])
        @automation.destroy
        redirect_to device_automations_path
    end

    private

    def automation_params
        params.require(:automation).permit(:name, :if_action, :then_action, :room_name, :device_id)
    end
end
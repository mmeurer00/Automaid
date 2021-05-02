class AutomationsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    def new
        @times = ["5:00 am","6:00 am", "7:00 am", "8:00 am","9:00 am","10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm", "6:00 pm", "7:00 pm", "8:00 pm", "9:00 pm", "10:00 pm", "11:00 pm", "12:00 am"]
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
            flash.now[:notice] = "Automation DID NOT save: "
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
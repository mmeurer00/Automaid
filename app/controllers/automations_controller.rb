class AutomationsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]

    def new
        device = current_user.devices.find_by(id: params[:device_id])
        @automation = device.automations.new
        #@automation.device = Device.find_by(id: params[:device_id])
    end

    def create
        device = current_user.devices.find_by(id: params[:device_id])
        @automation = device.automations.new(automation_params)
        @automation.device = Device.find_by(id: params[:device_id])
        #binding.pry
        if @automation.save
            if !@automation.id
                #flash.now[:notice] = "Automation DID NOT save. Fill in all fields."
                render :new
            else
            redirect_to device_automation_path(@automation.device, @automation)
            end
        else
            flash.now[:notice] = "Automation DID NOT save. Fill in all fields. "
            render :new
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
        @automation = current_user.automations.find_by(id: params[:id])
    end

    def edit
        @device = Device.find_by(id: params[:device_id])
        @automation = current_user.automations.find_by(id: params[:id])
        #binding.pry
    end

    def update
        @device = Device.find_by(id: params[:device_id])
        @automation = current_user.automations.find_by(id: params[:id])
        @automation.update(automation_params)
        if @automation.save
                redirect_to device_automation_path(@automation.device, @automation)
        else
            render :edit
        end
    end

    def destroy
        @device = Device.find_by(id: params[:device_id])
        @automation = current_user.automations.find_by(id: params[:id])
        @automation.destroy
        redirect_to device_automations_path(@device)
    end

    private

    def automation_params
        params.require(:automation).permit(:name, :if_action, :then_action, :room_id, :device_id)
    end
end
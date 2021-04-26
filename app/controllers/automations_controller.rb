class AutomationsController < ApplicationController
#must create user_device_id_controller before this works
    def new
        @automation = Automation.new
    end

    def create
        @automation = Automation.new(automation_params)
        if @automation.save! 
            redirect_to automations_path
        else
            redirect_to new_automation_path
        end
    end

    def index
        @automations = Automation.all
    end

    def show
        @automation = Automation.find(params[:id])
    end

    def edit
        @automation = Automation.find(params[:id])
    end

    def update 
        @automation = Automation.find(params[:id])
        @automation.update(automation_params)

        if @automation.valid?
            redirect_to automation_path(@automation)
        else
            render :edit
        end
    end

    def destroy
        @automation = Automation.find(params[:id])
        @automation.destroy
        redirect_to automations_path
    end

    private

    def automation_params
        params.require(:automation).permit(:name, :if_action, :then_action, :user_device_id)
    end
end
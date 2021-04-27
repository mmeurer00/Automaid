class RoomsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    
    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
    end

    def new
        @room = Room.new
        @user = current_user
    end

    def create
        @user = current_user
        @room = Room.new(room_params)
        if @room.save
            redirect_to room_path(@room)
        else
            render :new
        end
    end

    def edit
        @room = Room.find(params[:id])
    end
    
    def update 
        @room = Room.find(params[:id])
        @room.update(room_params)
        if @room.valid?
            redirect_to rooms_path
        else
            render :edit
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to rooms_path
    end

    private

    def room_params
        params.require(:room).permit(:name, :indoor, :outdoor, :user_id)
    end

end
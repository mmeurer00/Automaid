class RoomsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    
    def filter_by_location
       @rooms = current_user.rooms.filter_by_location(@rooms)
    end


    def index  
        @rooms = current_user.rooms
    end

    def show
        @room = current_user.rooms.find_by(id: params[:id])
    end

    def new
        @room = current_user.rooms.build
    end

    def create
        @room = current_user.rooms.new(room_params)
        if @room.save!
            redirect_to room_path(@room)
        else
            flash.now[:notice] = "Room DID NOT save: "
            render :new
        end
    end

    def edit
        @room = current_user.rooms.find(params[:id])
    end
    
    def update 
        @room = current_user.rooms.find(params[:id])
        @room.update(room_params)
        if @room.valid?
            redirect_to rooms_path
        else
            render :edit
        end
    end

    def destroy
        @room = current_user.rooms.find(params[:id])
        @room.destroy
        redirect_to rooms_path
    end

    private

    def room_params
        params.require(:room).permit(:name, :indoor, :outdoor, :user_id)
    end

end
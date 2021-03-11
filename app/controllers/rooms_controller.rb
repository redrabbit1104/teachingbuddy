class RoomsController < ApplicationController

  def index
  end
  
  def new
    users = User.where.not(id: current_user)
    @users = users.page(params[:users_page]).per(6)
    @room = Room.new
    @target_room = RoomUser.all
    @length= @target_room.length
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to room_messages_path(Room.last.id)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

private
  
  def room_params
    params.require(:room).permit(user_ids: []).merge(target_id: params[:room][:user_ids][1])
  end

end
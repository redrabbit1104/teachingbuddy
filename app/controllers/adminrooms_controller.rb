class AdminroomsController < ApplicationController

  def index
  end
  
  def new
    users = User.where.not(id: current_user)
    @users = users.page(params[:users_page]).per(6)
    @adminroom = AdminRoom.new
    if user_signed_in?
    @target_room = AdminRoom.all.where(user_id:current_user.id)
    #userで接続した場合、adminとのチャットに表示されるリストのリンクに必要なパラメーター
    @adminrooms = AdminRoom.where(user_id: current_user.id)
    else
    @target_room = AdminRoom.all.where(user_id:params[:format])
    end
  end

  def create
    # @room_admin_user = RoomAdminUser.new(room_admin_user_params)
    # @room_admin_user.save
    # redirect_to adminroom_adminmessages_path(AdminRoom.last.id)
    @admin_room = AdminRoom.new(room_params)
    @admin_room.save
    redirect_to adminroom_adminmessages_path(AdminRoom.last.id)
  end

  def destroy
    @adminroom = AdminRoom.find(params[:id])
    @adminroom.destroy
    redirect_to root_path
  end

private
  
  def room_params
    params.require(:admin_room).permit(:admin_id,:user_id)
  end

  # def room_admin_user_params
  #   params.require(:room_admin_user).permit(:target_id, :user_id, :admin_id, :room_id)
  # end
  
end

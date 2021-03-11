class MessagesController < ApplicationController

  def index
    users = User.where.not(id: current_user)
    @users = users.page(params[:users_page]).per(6)
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)

    if user_signed_in?
    #userで接続した場合、adminとのチャットに表示されるリストのリンクに必要なパラメーター
    @adminrooms = AdminRoom.where(user_id: current_user.id)
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  # def destroy
  #   @room = Room.find(params[:id])
  #   # @room = Room.find(params[:room_id])
  #   @room.destroy
  #   redirect_to root_path
  # end


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id,room_id:params[:room_id].to_i)
  end

end

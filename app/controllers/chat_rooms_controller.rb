class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    if current_user.user_type == "admin"
      @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
      #Messages to be rendered are only the ones created after user enter room
      @messages = @chat_room.messages #.where(created_at: Time.now..Time.now)
      @message = Message.new
    else
      redirect_to root_path
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end

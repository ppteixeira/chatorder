class ChatRoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:check_pin]

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
    room = ChatRoom.find_by(id: params[:id])
    if current_user.user_type == 'admin' || room.pin == params[:pin]
      @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
      #Messages to be rendered are only the ones created after user enter room
      @messages = @chat_room.messages #.where(created_at: Time.now..Time.now)
      @message = Message.new
    else
      redirect_to root_path
    end
  end


  def check_pin
    chat_room = ChatRoom.find_by( pin: params[:pin] )
    if !chat_room
      flash[:danger] = "PIN code invalid, try again"
      redirect_to root_path
    else
      sign_in(User.find('2'), scope: :user)
      redirect_to :controller => 'chat_rooms',
      :action => 'show',
      :id => chat_room.id, #chat_room id
      :pin => params[:pin]
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end

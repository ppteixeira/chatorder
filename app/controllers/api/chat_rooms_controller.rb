class Api::ChatRoomsController < ApplicationController
  def index
      chat_rooms = ChatRoom.all
      render json: chat_rooms.to_json
  end

  def change_pin
    #find the selected chat room in the DB
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:table_id])
    #all messages from this chat_room
    @messages = @chat_room.messages

    # Delete all previous messages from chat room
    @messages.each do |message|
      message.destroy
    end

    # create a new pin
    @chat_room.pin = Array.new(5){rand(36).to_s(36)}.join

    #Save info
    @chat_room.save

    #return pin as JSON data
    render json: @chat_room.pin.to_json
  end
end

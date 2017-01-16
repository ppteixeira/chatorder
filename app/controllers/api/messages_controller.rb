class Api::MessagesController < ApplicationController

  def check_messages
      chat_rooms = ChatRoom.all
      quantity = Messages.where(chat_room_id: params[:chat_room_id]).count
      render json: quantity.to_json
  end

end

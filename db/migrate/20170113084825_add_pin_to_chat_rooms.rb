class AddPinToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :pin, :string
  end
end

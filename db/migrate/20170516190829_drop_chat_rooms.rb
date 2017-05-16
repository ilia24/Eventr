class DropChatRooms < ActiveRecord::Migration[5.0]
  def change
  end
  drop_table :chat_rooms
  drop_table :chatlinkages
  drop_table :messages
end

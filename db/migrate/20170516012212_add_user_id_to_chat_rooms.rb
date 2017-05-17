class AddUserIdToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :user_id, :integer, foreign_key: true
  end
end

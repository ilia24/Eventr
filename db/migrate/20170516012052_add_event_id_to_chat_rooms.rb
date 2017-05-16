class AddEventIdToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :event_id, :integer
  end
end

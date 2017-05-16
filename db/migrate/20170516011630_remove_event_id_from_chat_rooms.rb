class RemoveEventIdFromChatRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :chat_rooms, :event_id_id, :integer
  end
end

class RemoveTitleFromChatRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :chat_rooms, :title, :string
    add_reference :chat_rooms, :group, index: true
  end
end

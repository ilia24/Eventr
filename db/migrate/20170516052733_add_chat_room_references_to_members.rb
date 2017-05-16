class AddChatRoomReferencesToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :chat_room, foreign_key: true
  end
end

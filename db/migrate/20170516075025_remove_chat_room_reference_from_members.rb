class RemoveChatRoomReferenceFromMembers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :members, :chat_room, foreign_key: true
  end
end

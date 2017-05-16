class AddTitleToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :title, :string
  end
end

class AddBodyToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :body, :text
    add_reference :messages, :chat_room, foreign_key: true
  end
end

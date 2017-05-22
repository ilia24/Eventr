class FixConversations < ActiveRecord::Migration[5.0]
  def change
    remove_index :conversations, [:author_id, :receiver_id]
  end
end

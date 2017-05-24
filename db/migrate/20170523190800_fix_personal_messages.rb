class FixPersonalMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :personal_messages, :user_id, :integer
    add_column :personal_messages, :author_id, :integer
    add_index :personal_messages, :author_id
    add_column :personal_messages, :receiver_id, :integer
    add_index :personal_messages, :receiver_id
  end
end

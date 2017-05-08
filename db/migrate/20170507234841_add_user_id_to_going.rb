class AddUserIdToGoing < ActiveRecord::Migration[5.0]
  def change
    add_column :goings, :user_id, :integer
  end
end

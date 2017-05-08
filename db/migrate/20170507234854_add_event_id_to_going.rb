class AddEventIdToGoing < ActiveRecord::Migration[5.0]
  def change
    add_column :goings, :event_id, :integer
  end
end

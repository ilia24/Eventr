class AddEventIdToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :event_id, :integer
  end
end

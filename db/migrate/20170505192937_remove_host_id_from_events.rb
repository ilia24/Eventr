class RemoveHostIdFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :host_id, :integer
  end
end

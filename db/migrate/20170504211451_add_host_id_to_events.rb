class AddHostIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :host_id, :integer
  end
end

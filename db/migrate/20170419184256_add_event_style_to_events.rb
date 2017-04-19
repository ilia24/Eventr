class AddEventStyleToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_style, :string
  end
end

class RemoveVenueStyleFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :venue_style
  end
end

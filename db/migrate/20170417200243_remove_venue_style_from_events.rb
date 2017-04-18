class RemoveVenueStyleFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :venue_style, :integer
  end
end

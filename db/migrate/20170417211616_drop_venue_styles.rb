class DropVenueStyles < ActiveRecord::Migration[5.0]
  def change
    drop_table :venue_styles
  end
end

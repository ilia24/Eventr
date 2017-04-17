class AddVenueStyleAndMusicStyleToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :venue_style, :string
    add_column :events, :music_style, :string
  end
end

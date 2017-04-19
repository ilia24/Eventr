class RemoveVenueAndMusicStyleFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :venue_style, :string
    remove_column :events, :music_style, :string
  end
end

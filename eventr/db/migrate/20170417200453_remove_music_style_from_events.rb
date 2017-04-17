class RemoveMusicStyleFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :music_style, :integer
  end
end

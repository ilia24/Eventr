class RemoveMusicStyleFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :music_style
  end
end

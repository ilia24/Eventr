class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :picurl
      t.date :date
      t.string :location
      t.integer :price
      t.integer :music_style
      t.integer :venue_style

      t.timestamps
    end
  end
end

class CreateEventrinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventrinfos do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.text :bio

      t.timestamps
    end
  end
end

class CreateHostinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :hostinfos do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.integer :capacity
      t.string :website

      t.timestamps
    end
  end
end

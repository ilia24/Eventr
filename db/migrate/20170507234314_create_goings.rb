class CreateGoings < ActiveRecord::Migration[5.0]
  def change
    create_table :goings do |t|
      t.integer :number

      t.timestamps
    end
  end
end

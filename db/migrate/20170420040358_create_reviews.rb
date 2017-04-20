class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :liked_by
      t.integer :disliked_by
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end

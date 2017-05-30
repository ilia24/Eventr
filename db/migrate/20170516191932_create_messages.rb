class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
    create_table :comments do |t|
      t.text :content
      t.references :message, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end

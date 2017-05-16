class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.text :body
      t.belongs_to :chat_room, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

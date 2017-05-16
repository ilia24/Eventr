class CreateChatlinkages < ActiveRecord::Migration[5.0]
  def change
    create_table :chatlinkages do |t|
      t.belongs_to :chat_room, index: true
      t.belongs_to :user, index: true
      t.boolean :owner
      t.timestamps
    end
  end
end

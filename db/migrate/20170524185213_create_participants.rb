class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
       t.belongs_to :conversation, index: true
       t.belongs_to :user, index: true
       t.timestamps
    end
  end
end

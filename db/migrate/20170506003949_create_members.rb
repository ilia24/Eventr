class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
       t.belongs_to :group, index: true
       t.belongs_to :user, index: true
       t.boolean :owner
       t.timestamps
    end
  end
end

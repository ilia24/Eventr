class AddAttachmentAvatarToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :events, :avatar
  end
end

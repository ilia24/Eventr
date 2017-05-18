class Group < ApplicationRecord
  belongs_to :event
  has_many :members
  has_many :users, through: :members
  has_many :messages, dependent: :destroy


  def setowner(user)
    self.users << user
    usergroup = user.members.find_by(group_id: self.id)
    usergroup.update(owner: true)

  end
end

class Group < ApplicationRecord
  belongs_to :event
  has_many :members
  has_many :users, through: :members

  has_many :requests
  has_many :invited_users, through: :requests
  has_many :messages, dependent: :destroy


 #
 #  has_many :observed_teams, :through => :reviews,
 # :source => :commentable, :source_type => "SoccerTeam"


  def setowner(user)
    self.users << user
    usergroup = user.members.find_by(group_id: self.id)
    usergroup.update(owner: true)
  end
end

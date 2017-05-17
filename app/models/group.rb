class Group < ApplicationRecord
  belongs_to :event
  has_many :members
  has_many :users, through: :members
  has_many :messages, dependent: :destroy

  # def adduser(user)
  #   if self.users.exclude? user
  #     self.users << user
  #   end
  # end


end

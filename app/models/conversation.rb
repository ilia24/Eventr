class Conversation < ApplicationRecord

  has_many :participants
  has_many :users, through: :participants
  has_many :personal_messages, dependent: :destroy

end

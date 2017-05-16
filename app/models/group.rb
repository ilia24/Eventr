class Group < ApplicationRecord
  belongs_to :event
  has_one :chat_room
  has_many :members
  has_many :users, through: :members



end

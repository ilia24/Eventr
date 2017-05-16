class Group < ApplicationRecord
  belongs_to :event
  has_many :members
  has_many :users, through: :members
  has_many :chat_rooms
end

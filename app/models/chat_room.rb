class ChatRoom < ApplicationRecord
  belongs_to :group
  has_many :messages, dependent: :destroy
  has_many :members
  has_many :users, through: :members
  has_one :event, through: :group



end

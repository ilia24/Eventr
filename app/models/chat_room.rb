class ChatRoom < ApplicationRecord
  belongs_to :group
  belongs_to :event
  has_many :messages, dependent: :destroy
end

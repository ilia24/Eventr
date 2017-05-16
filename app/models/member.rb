class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :chat_room
end

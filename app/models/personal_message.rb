class PersonalMessage < ApplicationRecord

  validates :body, presence: true
  belongs_to :conversation
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  after_create_commit do
    conversation.touch
    NotificationBroadcastJob.perform_later(self)
  end


end

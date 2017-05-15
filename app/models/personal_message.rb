class PersonalMessage < ApplicationRecord

  validates :body, presence: true
  belongs_to :conversation
  belongs_to :user

  after_create_commit do
    conversation.touch
    NotificationBroadcastJob.perform_later(self)
  end

end

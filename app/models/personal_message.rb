class PersonalMessage < ApplicationRecord

  validates :body, presence: true
  belongs_to :conversation
  belongs_to :user
  after_create_commit { ChatBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%l:%M %P')
  end

end

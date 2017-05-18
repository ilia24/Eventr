class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  mount_uploader :avatar, AvatarUploader

  has_one :hostinfo
  has_one :eventrinfo
  has_many :reviews
  has_many :goings
  has_many :events, through: :goings
  has_many :members
  has_many :groups, through: :members
  has_many :messages, dependent: :destroy


  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  has_many :personal_messages, dependent: :destroy


  def channel
    "alerts_#{id}_channel"
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_secure_password
  validates :email, presence: true
  mount_uploader :avatar, AvatarUploader

  has_one :hostinfo
  has_one :eventrinfo
  has_many :reviews
  has_many :events, through: :goings
  has_many :members
  has_many :groups, through: :members
  has_many :goings

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  has_many :personal_messages, dependent: :destroy

  has_many :messages
  has_many :comments

  def online?
    !Redis.new.get("user_#{self.id}_online").nil?
  end
end

class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: true

  validates :password, :presence => true,
                     :confirmation => true,
                     :length => {:within => 6..40},
                     :on => :create
  validates :password, :confirmation => true,
                     :length => {:within => 6..40},
                     :allow_blank => true,
                     :on => :update

  mount_uploader :avatar, AvatarUploader

  has_one :hostinfo
  has_one :eventrinfo
  has_many :reviews
  has_many :goings
  has_many :events, through: :goings
  has_many :members
  has_many :groups, through: :members
  has_many :requests
  has_many :requested_groups, through: :requests
  has_many :messages, dependent: :destroy


  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  has_many :personal_messages, dependent: :destroy

  def ownedrequests
    requests = []
    self.members.all.each do |m|
      if (m.owner == true) && (m.group.invited_users.empty? != true)
        m.group.invited_users.each do |i|
          requests << i
        end
      end
    end
    return requests
  end


  def channel
    "alerts_#{id}_channel"
  end
end

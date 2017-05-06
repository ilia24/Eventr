class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true

  has_one :hostinfo
  has_one :eventrinfo
  has_many :reviews
  has_many :events
  has_many :groups, through: :members
end

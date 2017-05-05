class User < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true

  has_one :hostinfo
  has_one :eventrinfo
  has_many :reviews
  has_many :events
  has_and_belongs_to_many :groups
end

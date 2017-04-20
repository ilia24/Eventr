class User < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true

  has_many :reviews
  has_many :events, through: :reviews
end

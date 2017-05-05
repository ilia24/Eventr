class Host < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true
  has_many :events
end

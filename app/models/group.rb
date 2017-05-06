class Group < ApplicationRecord
  belongs_to :event
  has_many :users, through: :members
end

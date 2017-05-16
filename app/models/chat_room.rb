class ChatRoom < ApplicationRecord
  belongs_to :group
  has_many :messages, dependent: :destroy
  has_one :event, through: :group
  has_many :chatlinkages
  has_many :users, through: :chatlinkages

end

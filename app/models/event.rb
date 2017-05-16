class Event < ApplicationRecord
  geocoded_by :location
  after_validation :geocode
  belongs_to :user
  has_many :groups
  has_many :goings
  has_many :users, through: :goings
  # validates :name, :description, :date, :location, presence: true
  # validates :price, numericality: {only_integer: true}

  has_many :reviews
  has_many :chat_rooms, through: :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :avatar
    # has_attached_file :avatar, styles: { thumb: ["32x32#", :png] }
    # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


def self.search(search)
  where("name LIKE ? OR price LIKE ? OR description LIKE ? OR location LIKE ? OR event_style LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" )
end
end

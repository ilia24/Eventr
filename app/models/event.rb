class Event < ApplicationRecord
  geocoded_by :location
  after_validation :geocode
  belongs_to :user
  has_many :groups
  has_many :goings
  has_many :users, through: :goings
  has_many :reviews
  # validates :name, :description, :date, :location, presence: true
  # validates :price, numericality: {only_integer: true}

def self.search(search)
  where("NAME::text LIKE ? OR PRICE::text LIKE ? OR DESCRIPTION::text LIKE ? OR LOCATION::text LIKE ? OR EVENT_STYLE::text LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" )
end

def self.where_search(search)
  where("name LIKE ? OR description LIKE ? OR location LIKE ? OR event_style LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" )
end

def self.category_search(search)
  where("name LIKE ? OR description LIKE ? OR location LIKE ? OR event_style LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" )
end

def dropusergroups(user)
  self.groups.each do |g|
    if g.users.include? user
      g.users.delete(user)
      if g.users.empty?
        g.delete
      end
    end
  end
end


def adduser(user)
  if self.users.exclude? user
    self.users << user
  end
end


end

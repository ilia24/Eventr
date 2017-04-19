class Event < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :avatar
    # has_attached_file :avatar, styles: { thumb: ["32x32#", :png] }
    # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

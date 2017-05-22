class PersonalMessage < ApplicationRecord

  validates :body, presence: true
  belongs_to :conversation
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"


end

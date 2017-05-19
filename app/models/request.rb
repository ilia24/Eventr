class Request < ApplicationRecord
  belongs_to :invited_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :requested_group, class_name: 'Group', foreign_key: 'group_id'
end

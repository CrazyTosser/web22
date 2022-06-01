class Value < ApplicationRecord
  belongs_to :user
  belongs_to :framework

  scope :filter_by_user, -> (id) { where user_id: id.to_i }
  scope :filter_by_frame, -> (id) { where framework_id: id.to_i }
end

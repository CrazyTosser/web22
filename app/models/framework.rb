class Framework < ApplicationRecord
  belongs_to :theme
  belongs_to :user
  has_many :values

  scope :filter_by_theme, -> (id) { where theme_id: id.to_i }
  scope :filter_by_user, -> (id) { where user_id: id.to_i }
end

class Area < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :area_locations, inverse_of: :area
  has_many :locations, through: :area_locations, inverse_of: :areas

  def should_generate_new_friendly_id?
    name_changed?
  end
end

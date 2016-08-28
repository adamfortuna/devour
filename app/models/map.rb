class Map < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :admin_user, foreign_key: :user_id

  has_many :location_maps, inverse_of: :map
  has_many :locations, through: :location_maps

  accepts_nested_attributes_for :location_maps, :allow_destroy => true
  accepts_nested_attributes_for :locations, :allow_destroy => true

  def should_generate_new_friendly_id?
    title_changed?
  end
end

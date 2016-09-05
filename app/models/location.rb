class Location < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :photo, PhotoUploader

  belongs_to :address
  has_many :area_locations, inverse_of: :location
  has_many :areas, through: :area_locations, inverse_of: :locations

  has_many :location_social_sites, inverse_of: :location
  has_many :social_sites, through: :location_social_sites

  has_many :location_maps, inverse_of: :location
  has_many :maps, through: :location_maps

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :area_locations

  accepts_nested_attributes_for :location_social_sites, allow_destroy: true
  accepts_nested_attributes_for :social_sites

  def should_generate_new_friendly_id?
    name_changed?
  end

  def directions_url
    "https://www.google.com/maps/place/#{address.address}"
  end
end

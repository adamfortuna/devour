class Address < ApplicationRecord
  has_one :location

  geocoded_by :full_street_address, latitude: :lat, longitude: :lng
  after_validation :geocode

  def full_street_address
    [street, city, postal_code, region, country].compact.join(', ')
  end
end

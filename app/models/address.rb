class Address < ApplicationRecord
  has_one :location

  geocoded_by :full_street_address, latitude: :lat, longitude: :lng
  after_validation :geocode

  def full_street_address
    [street, city, postal_code, region, country].compact.join(', ')
  end

  def as_json(options={})
    {
      street: street,
      city: city,
      postal_code: postal_code,
      region: region,
      country: country,
      lat: lat,
      lng: lng
    }
  end
end

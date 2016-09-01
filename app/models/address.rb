class Address < ApplicationRecord
  has_one :location
  acts_as_mappable auto_geocode: true
  before_validation :geocode_address, on: :update

  def address
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

  private

  def geocode_address
    geo = Geokit::Geocoders::MultiGeocoder.geocode(address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat, geo.lng if geo.success
  end
end

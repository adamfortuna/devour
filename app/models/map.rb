class Map < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :photo, PhotoUploader

  belongs_to :admin_user, foreign_key: :user_id

  has_many :location_maps, inverse_of: :map
  has_many :locations, through: :location_maps

  accepts_nested_attributes_for :location_maps, allow_destroy: true
  accepts_nested_attributes_for :locations

  def self.closest(session_location)
    begin
      return Map.first unless session_location

      if session_location.is_a? Geokit::GeoLoc
        location = Geokit::LatLng.new(session_location.lat, session_location.lng)
      elsif session_location.is_a? Hash
        location = Geokit::LatLng.new(session_location['lat'], session_location['lng'])
      else
        raise Exception.new('Looks like the session came back with an unexpected result')
      end

      if address = Address.within(250, origin: location).first
        map = address.location.maps.first
      end

      map || Map.first
    rescue Exception => e
      return Map.first
    end
  end

  def should_generate_new_friendly_id?
    title_changed?
  end


  def as_json(options={})
    {
      title: title,
      short_title: short_title,
      slug: slug,
      description: description,
      photo: photo.url(:thumb),
      photo_src: photo_src,
      photo_src_url: photo_src_url,
      locations: location_maps
    }
  end
end

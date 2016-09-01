class HomeController < ApplicationController
  geocode_ip_address

  def contact; end

  def locate
    redirect_to map_path(closest_map)
  end

  private

  def closest_map
    if session[:geo_location].is_a? Hash
      lat_Lng = Geokit::LatLng.new(session[:geo_location]['lat'], session[:geo_location]['lng'])
      if address = Address.within(250, origin: lat_Lng).first
        map = address.location.maps.first
      end
    else
      if address = Address.within(250, origin: session[:geo_location]).first
        map = address.location.maps.first
      end
    end

    map || Map.first
  end
end

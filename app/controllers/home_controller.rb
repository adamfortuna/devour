class HomeController < ApplicationController
  geocode_ip_address

  def contact; end

  def locate
    if session[:geo_location]['lat'] && session[:geo_location]['lng']
      lat_Lng = Geokit::LatLng.new(session[:geo_location]['lat'], session[:geo_location]['lng'])
      if address = Address.within(250, origin: lat_Lng).first
        redirect_to map_path(address.location.map)
      else
        redirect_to map_path(Map.first)
      end
    else
      redirect_to map_path(Map.first)
    end
  end
end

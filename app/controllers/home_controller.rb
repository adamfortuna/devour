class HomeController < ApplicationController
  geocode_ip_address

  def contact; end

  def locate
    redirect_to map_path(closest_map)
  end

  private

  def closest_map
    Map.closest(session[:geo_location])
  end
end

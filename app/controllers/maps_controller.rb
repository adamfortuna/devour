class MapsController < ApplicationController
  respond_to :html, :json

  def show
    @map = Map.friendly.includes(
      location_maps: [
        location: [
          :address,
          :areas,
          :maps,
          location_social_sites: [
            :social_site
          ]
        ]
      ])
      .find(params[:id])

    respond_with @map
  end
end

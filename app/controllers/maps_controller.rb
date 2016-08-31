class MapsController < ApplicationController
  respond_to :html, :json

  def show
    @map = Map.friendly.find(params[:id])

    respond_with @map
  end
end

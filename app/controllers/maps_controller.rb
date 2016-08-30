class MapsController < ApplicationController
  def show
    @map = Map.friendly.find(params[:id])
  end
end

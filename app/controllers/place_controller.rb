class PlaceController < ApplicationController

  def list_places_actives_from_city
    places = Place.enabled.from_city(params[:id])
    render json: {places: places}, status: :ok
  end

end

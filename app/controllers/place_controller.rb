class PlaceController < ApplicationController

  def list_places_actives_from_city
    places = Place.enabled.from_city(params[:id])
    render json: {places: places}, status: :ok
  end

  def show_place_full
    place = Place.find(params[:id])

    galleries = place.galleries
    galleries_positions_results = get_positions(galleries)

    routes = place.routes
    routes_positions_results = get_positions(routes)

    render json: {place: place, galleries: galleries_positions_results, routes: routes_positions_results}, status: :ok
  end

  def get_positions(collection)
    result = []
    collection.each do |item|
      hash = Hash.new
      hash[:info] = item
      hash[:positions] = item.positions
      result << hash
    end
    result
  end

end

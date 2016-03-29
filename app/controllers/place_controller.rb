class PlaceController < ApplicationController
  before_action :verify_auth, only: [:add]

  def add
    place_params = new_place_params()
    place = Place.new
    place.name = place_params[:name]
    place.city_id = place_params[:city_id]
    place.user_id = @author.id
    place.status = 1

    position = JSON.parse(place_params[:position])
    place.longitude = position['longitude']
    place.latitude = position['latitude']


    if place.save
      return render json: {message: 'Local adicionado com sucesso'}, status: :ok
    else
      return render json: {message: 'Não foi possível adicionar'}, status: :unauthorized
    end

  end

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

  private

  def new_place_params
    params.permit(:city_id, :name, :position)
  end

  def user_params
    params.permit(:email,:access_token)
  end

  def verify_auth
    user_params = user_params()
    @author = User.verify_auth(user_params[:email], user_params[:access_token]).first
    return render json: {error: 'Usuário não autorizado'}, status: :unauthorized unless @author.present?
  end

end

class RouteController < ApplicationController
  before_action :verify_auth

  def add
    route_params = new_route_params()
    route = Route.new
    route.name = route_params[:name]
    route.place_id = route_params[:place_id]
    route.user_id = @author.id

    if route.save
      positions = JSON.parse(route_params[:positions])
      positions.each { |p| route.positions.create(longitude: p['longitude'], latitude: p['latitude']) }
      return render json: {message: 'Caminho adicionado com sucesso.'}, status: :ok
    else
      return render json: {error: 'Não foi possível adicionar'}, status: :unauthorized
    end

  end

  def list_routes_from_place
    routes = Place.find(params[:id]).routes
    results = []
    routes.each do |route|
      result = Hash.new
      result[:info] = route
      result[:positions] = route.positions
      results << result
    end
    render json: {routes: results}, status: :ok
  end

  private

  def user_params
    params.permit(:email,:access_token)
  end

  def new_route_params
    params.permit(:place_id, :name, :positions)
  end

  def verify_auth
    user_params = user_params()
    @author = User.verify_auth(user_params[:email], user_params[:access_token]).first
    return render json: {error: 'Usuário não autorizado'}, status: :unauthorized unless @author.present?
  end
end
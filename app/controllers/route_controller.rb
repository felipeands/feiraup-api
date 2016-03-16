class RouteController < ApplicationController

  def add
    user_params = user_params()
    author = User.verify_auth(user_params[:email], user_params[:access_token]).first
    return render json: {error: 'Usuário não autorizado'}, status: :unauthorized unless author.present?

    route_params = new_route_params()
    route = Route.new
    route.name = route_params[:name]
    route.place_id = route_params[:place_id]
    route.user_id = author.id

    if route.save
      positions = JSON.parse(route_params[:positions])
      positions.each { |p| Position.create(longitude: p['longitude'], latitude: p['latitude'], route: route) }
      return render json: {message: 'Caminho adicionado com sucesso.'}, status: :ok
    else
      return render json: {error: 'Não foi possível adicionar'}, status: :unauthorized
    end

  end

  private

  def user_params
    params.permit(:email,:access_token)
  end

  def new_route_params
    params.permit(:place_id, :name, :positions)
  end
end
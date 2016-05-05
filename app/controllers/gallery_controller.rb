class GalleryController < ApplicationController
  before_action :verify_auth, except: [:list_galleries_from_place, :gallery_info]

  def add
    gallery_params = new_gallery_params()
    gallery = Gallery.new
    gallery.name = gallery_params[:name]
    gallery.place_id = gallery_params[:place_id]
    gallery.user_id = @author.id
    gallery.floors = gallery_params[:floors]
    gallery.address = gallery_params[:address]

    if gallery.save

      positions = JSON.parse(gallery_params[:positions])
      positions.each { |p| gallery.positions.create(longitude: p['longitude'], latitude: p['latitude']) }

      doors = JSON.parse(gallery_params[:doors])
      doors.each { |d| gallery.doors.create(longitude: d['longitude'], latitude: d['latitude']) }

      return render json: {message: 'Galeria adicionada com sucesso.'}, status: :ok
    else
      return render json: {error: 'Não foi possível adicionar'}, status: :unauthorized
    end

  end

  def list_galleries_from_place
    galleries = Place.find(params[:id]).galleries
    render json: {galleries: galleries}, status: :ok
  end

  def list_galleries_actives_from_place_with_positions
    galleries = Place.find(params[:id]).galleries
    results = []
    galleries.each do |route|
      result = Hash.new
      result[:info] = route
      result[:positions] = route.positions
      results << result
    end
    render json: {galleries: results}, status: :ok
  end

  def gallery_info
    gallery = Gallery.find(params[:id])
    render json: {gallery: gallery}, status: :ok
  end

  private

  def user_params
    params.permit(:email,:access_token)
  end

  def new_gallery_params
    params.permit(:place_id, :name, :positions, :doors, :floors, :address)
  end

  def verify_auth
    user_params = user_params()
    @author = User.verify_auth(user_params[:email], user_params[:access_token]).first
    return render json: {error: 'Usuário não autorizado'}, status: :unauthorized unless @author.present? && @author.is_admin
  end
end
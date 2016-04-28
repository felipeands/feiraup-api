class ShopController < ApplicationController
  before_action :verify_auth

  def add
    shop_params = new_shop_params
    shop = Shop.new
    shop.name = shop_params[:name]
    shop.gallery_id = shop_params[:gallery_id] if shop_params[:gallery_id].present? && shop_params[:gallery_id] != 'undefined'
    shop.street = shop_params[:street]
    shop.street_corner = shop_params[:street_corner]
    shop.floor = shop_params[:floor]
    shop.route_id = shop_params[:route_id] if shop_params[:route_id].present? && shop_params[:route_id] != 'undefined'

    position = JSON.parse(shop_params[:position])
    shop.longitude = position['longitude']
    shop.latitude = position['latitude']

    shop.author_id = @author.id
    shop.owner_id = @author.id
    shop.status = 1

    if shop.save
      eval(shop_params[:categories]).each { |c| shop.shop_categories.create(category_id: c) }
      return render json: {message: 'Loja adicionada com sucesso.'}, status: :ok
    else
      return render json: {message: 'Não foi possível adicionar'}, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email,:access_token)
  end

  def new_shop_params
    params.permit(:name,:gallery_id,:street,:street_corner,:floor,:route_id,:position,:categories)
  end

  def verify_auth
    user_params = user_params()
    @author = User.verify_auth(user_params[:email], user_params[:access_token]).first
    return render json: {error: 'Usuário não autorizado'}, status: :unauthorized unless @author.present? && @author.is_admin
  end
end

class ShopController < ApplicationController
  before_action :verify_auth

  def add
    shop_params = new_shop_params
    shop = Shop.new
    shop.name = shop_params[:name]
    shop.email = shop_params[:shop_email]
    shop.phone = shop_params[:phone]
    shop.phone2 = shop_params[:phone2]
    shop.gallery_id = shop_params[:gallery_id] if shop_params[:gallery_id].present? && shop_params[:gallery_id] != 'undefined'
    shop.street = shop_params[:street]
    shop.street_corner = shop_params[:street_corner]
    shop.floor = shop_params[:floor]
    shop.route_id = shop_params[:route_id] if shop_params[:route_id].present? && shop_params[:route_id] != 'undefined'
    shop.place_id = shop_params[:place_id] if shop_params[:place_id].present? && shop_params[:place_id] != 'undefined'
    shop.obs = shop_params[:obs]

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

  def list_shops_from_place
    shops = Shop.find(params[:id]).shops
    render json: {shops: shops}, status: :ok
  end

  private

  def user_params
    params.permit(:email,:access_token)
  end

  def new_shop_params
    params.permit(:name,:shop_email,:phone,:phone2,:gallery_id,:street,:street_corner,:floor,:route_id,:position,:categories,:place_id,:obs)
  end

  def verify_auth
    user_params = user_params()
    @author = User.verify_auth(user_params[:email], user_params[:access_token]).first
    return render json: {error: 'Usuário não autorizado'}, status: :unauthorized unless @author.present? && @author.is_admin
  end
end

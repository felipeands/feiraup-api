class CityController < ApplicationController
  def list_actives
    cities = City.enabled.select(:id, :name).order(name: :ASC)
    render json: {cities: cities}, status: :ok
  end
end

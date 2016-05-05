class Place < ActiveRecord::Base
  has_many :routes, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :shops
  belongs_to :city

  has_one :position, -> { where(position_type: 'position') }, as: :local, dependent: :destroy

  enum status: { disabled: 0, enabled: 1 }

  def self.from_city(city_id, order = :asc)
    select(:id, :name, :address, :city_id).where(city_id: city_id).order(name: order)
  end

  def shops_with_positions
    shops = []
    self.shops.each do |s|
      obj = s.as_json
      obj[:latitude] = s.position.latitude
      obj[:longitude] = s.position.longitude
      shops << obj
    end
    shops
  end

  def place_with_position
    place = self.as_json
    place[:latitude] = self.position.latitude
    place[:longitude] = self.position.longitude
    place
  end

end

class Place < ActiveRecord::Base
  has_many :routes, dependent: :destroy
  has_many :galleries, dependent: :destroy
  belongs_to :city

  enum status: { disabled: 0, enabled: 1 }

  def self.from_city(city_id, order = :asc)
    select(:id, :name, :address, :city_id).where(city_id: city_id).order(name: order)
  end

end

class Place < ActiveRecord::Base
  belongs_to :city

  enum status: { disabled: 0, enabled: 1 }

  def self.from_city(city_id, order = :asc)
    where(city_id: city_id).order(name: order)
  end

end

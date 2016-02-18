class State < ActiveRecord::Base
  belongs_to :capital, class_name: 'City'
  has_many :cities

  def self.get_all
    State.all.pluck(:name)
  end

  def self.get_cities(state)
    state.cities.pluck(:name)
  end
end

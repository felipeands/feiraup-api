class City < ActiveRecord::Base
  def self.from_state(state_id, order = :asc)
    where(state_id: state_id).order(name: order)
  end
end

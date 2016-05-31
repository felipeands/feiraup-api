class City < ActiveRecord::Base
  has_many :places
  has_one :state

  enum status: { disabled: 0, enabled: 1 }

  def self.from_state(state_id, order = :asc)
    where(state_id: state_id).order(name: order)
  end
end

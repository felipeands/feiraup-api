class Route < ActiveRecord::Base
  has_many :positions, dependent: :destroy
  belongs_to :place
  belongs_to :user
end

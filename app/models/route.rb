class Route < ActiveRecord::Base
  has_many :positions, -> { where(position_type: 'position') }, as: :local, dependent: :destroy
  belongs_to :place
  belongs_to :user
end

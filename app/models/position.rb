class Position < ActiveRecord::Base
  belongs_to :local, polymorphic: true
  belongs_to :route
  belongs_to :shop
  belongs_to :place
end

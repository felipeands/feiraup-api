class Position < ActiveRecord::Base
  belongs_to :local, polymorphic: true
  belongs_to :route
end

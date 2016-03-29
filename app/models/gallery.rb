class Gallery < ActiveRecord::Base
  has_many :positions, as: :local, dependent: :destroy
  belongs_to :place
  belongs_to :user
end

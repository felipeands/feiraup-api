class Gallery < ActiveRecord::Base
  belongs_to :place
  belongs_to :user

  has_many :positions, -> { where(position_type: 'position') }, as: :local, dependent: :destroy

  has_many :doors, -> { where(position_type: 'door') }, as: :local, class_name: 'Position', dependent: :destroy

end

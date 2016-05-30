class Shop < ActiveRecord::Base
  has_many :shop_categories, dependent: :destroy

  # allow get "categories" from "shop"
  has_many :shop_categories
  has_many :categories, through: :shop_categories, source: 'category'

  has_one :position, -> { where(position_type: 'position') }, as: :local, dependent: :destroy

  belongs_to :gallery
  belongs_to :route

  belongs_to :user, foreign_key: 'owner_id'
  belongs_to :user, foreign_key: 'author_id'

  enum status: { disabled: 0, enabled: 1 }

  def get_address
    if self.gallery.present?

    elsif self.route.present?
      route = self.route
      street = route
      place = street.place
      city = place.city
    end
  end

end

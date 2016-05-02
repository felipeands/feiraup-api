class AddPlaceToShops < ActiveRecord::Migration
  def change
    add_reference :shops, :place, index: true, foreign_key: true
  end
end

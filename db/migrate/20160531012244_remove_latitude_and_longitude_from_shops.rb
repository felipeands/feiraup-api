class RemoveLatitudeAndLongitudeFromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :latitude, :string
    remove_column :shops, :longitude, :string
  end
end

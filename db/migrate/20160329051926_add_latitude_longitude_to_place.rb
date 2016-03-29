class AddLatitudeLongitudeToPlace < ActiveRecord::Migration
  def change
    add_column :places, :latitude, :string
    add_column :places, :longitude, :string
  end
end

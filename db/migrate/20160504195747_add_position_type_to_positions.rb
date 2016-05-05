class AddPositionTypeToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :position_type, :string

    remove_column :shops, :latitude
    remove_column :shops, :longitude

    remove_column :places, :latitude
    remove_column :places, :longitude
    remove_column :places, :integer

    Shop.all.destroy_all
    Route.all.destroy_all
    Gallery.all.destroy_all
    Place.all.destroy_all

    # place seed
    place = Place.new(name: 'Feira hippie', city_id: 1008, status: 1)
    place.build_position(latitude: -16.71374161795954, longitude: -49.252157222784376)
    place.save
  end
end

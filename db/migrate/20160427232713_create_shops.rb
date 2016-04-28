class CreateShops < ActiveRecord::Migration
  def up
    create_table :shops do |t|
      t.string :name
      t.references :gallery, index: true, foreign_key: true
      t.string :street
      t.string :street_corner
      t.integer :floor
      t.references :route, index: true, foreign_key: true
      t.string :latitude
      t.string :longitude
      t.integer :owner_id
      t.integer :author_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
  def down
    drop_table :shops
  end
end

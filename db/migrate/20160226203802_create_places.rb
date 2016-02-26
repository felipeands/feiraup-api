class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :address
      t.string :photo
      t.references :city, index: true, foreign_key: true
      t.integer :status, :integer, default: 0

      t.timestamps null: false
    end
  end
end

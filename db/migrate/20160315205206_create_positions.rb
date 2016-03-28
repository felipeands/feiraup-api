class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :lat
      t.string :lng
      t.references :local, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end

class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.references :place, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

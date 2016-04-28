class CreateShopCategories < ActiveRecord::Migration
  def up
    create_table :shop_categories do |t|
      t.references :shop, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
    drop_table :shop_categories
  end
end

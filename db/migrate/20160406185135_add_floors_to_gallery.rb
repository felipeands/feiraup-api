class AddFloorsToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :floors, :integer, default: 1
  end
end

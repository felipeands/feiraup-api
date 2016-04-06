class AddFloorsToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :floors, :integer
  end
end

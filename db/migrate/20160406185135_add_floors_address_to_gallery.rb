class AddFloorsAddressToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :floors, :integer, default: 1
    add_column :galleries, :address, :text
  end
end

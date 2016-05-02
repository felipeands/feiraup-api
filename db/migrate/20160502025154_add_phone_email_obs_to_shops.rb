class AddPhoneEmailObsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :phone, :string
    add_column :shops, :phone2, :string
    add_column :shops, :email, :string
    add_column :shops, :obs, :text
  end
end

class AddStatusToCities < ActiveRecord::Migration
  def change
    add_column :cities, :status, :integer, default: 0
  end
end

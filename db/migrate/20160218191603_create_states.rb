class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :acronym
      t.string :name
      t.string :capital_id, index: true

      t.timestamps null: false
    end
  end
end

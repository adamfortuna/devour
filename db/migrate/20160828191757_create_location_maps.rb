class CreateLocationMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :location_maps do |t|
      t.integer :map_id, null: false
      t.integer :location_id, null: false
      t.float :rating
      t.integer :order
      t.text :description
      t.boolean :show_order, null: false, default: true
    end
  end
end

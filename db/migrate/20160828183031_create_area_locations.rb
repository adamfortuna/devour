class CreateAreaLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :area_locations do |t|
      t.integer :area_id, null: false
      t.integer :location_id, null: false
    end
  end
end

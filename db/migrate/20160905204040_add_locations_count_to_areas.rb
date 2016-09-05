class AddLocationsCountToAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :locations_count, :integer, nil: false, default: 0

    Area.reset_column_information
    Area.find_each { |area| Area.reset_counters(area.id, :locations) }
  end
end

class AddShortDescriptionToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :short_description, :text
  end
end

class AddShortDescriptionToMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :short_description, :text
  end
end

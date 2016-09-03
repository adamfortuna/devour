class RemovePriceFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :price
  end
end

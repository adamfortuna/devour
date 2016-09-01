class AddLatLngIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :addresses, [:lat, :lng]
  end
end

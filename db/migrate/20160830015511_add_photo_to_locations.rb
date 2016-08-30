class AddPhotoToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :photo, :string
    add_column :locations, :photo_src, :string
    add_column :locations, :photo_src_url, :string
  end
end

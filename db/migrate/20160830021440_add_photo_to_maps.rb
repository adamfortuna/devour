class AddPhotoToMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :photo, :string
    add_column :maps, :photo_src, :string
    add_column :maps, :photo_src_url, :string
  end
end

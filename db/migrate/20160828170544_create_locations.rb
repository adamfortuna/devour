class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.timestamps
      t.integer :address_id, null: false, unique: true

      t.string :name, null: false
      t.string :slug, null: false
      t.integer :price
      t.text :description
      t.float :rating
      t.text :website
      t.string :review_url
    end

    add_index :locations, :slug
    add_index :locations, :address_id
  end
end

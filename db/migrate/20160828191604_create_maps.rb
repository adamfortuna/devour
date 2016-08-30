class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.timestamps
      t.string :title, null: false
      t.string :short_title, null: false
      t.string :slug, null: false
      t.text :description, null: false
    end
  end
end

class AddSlugs < ActiveRecord::Migration[5.0]
  def up
    add_column :areas, :slug, :string, null: false, unique: true
    add_index :areas, :slug
  end

  def down
    remove_column :areas, :slug
  end
end

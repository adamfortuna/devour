class Areas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.timestamps
      t.string :name, null: false
      t.boolean :public, null: false, default: true
    end
  end
end

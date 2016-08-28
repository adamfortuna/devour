class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.float :lat
      t.float :lng
    end
  end
end

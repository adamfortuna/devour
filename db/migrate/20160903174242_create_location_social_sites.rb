class CreateLocationSocialSites < ActiveRecord::Migration[5.0]
  def change
    create_table :location_social_sites do |t|
      t.integer :location_id, nil: false
      t.integer :social_site_id, nil: false
    end
  end
end

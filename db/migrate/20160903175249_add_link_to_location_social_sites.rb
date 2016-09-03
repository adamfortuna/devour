class AddLinkToLocationSocialSites < ActiveRecord::Migration[5.0]
  def change
    add_column :location_social_sites, :url, :string, nil: false
  end
end

class CreateSocialSites < ActiveRecord::Migration[5.0]
  def change
    create_table :social_sites do |t|
      t.string :name, nil: false
      t.string :slug, nil: false
    end
  end
end

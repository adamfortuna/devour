class SocialSite < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :location_social_sites, inverse_of: :social_site
  has_many :locations, through: :location_social_sites

  default_scope -> { order('name') }

  def should_generate_new_friendly_id?
    name_changed?
  end
end

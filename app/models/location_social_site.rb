class LocationSocialSite < ApplicationRecord
  belongs_to :location
  belongs_to :social_site

  validates :location, presence: true
  validates :social_site, presence: true

  accepts_nested_attributes_for :social_site, :reject_if => :all_blank
end

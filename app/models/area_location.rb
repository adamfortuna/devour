class AreaLocation < ApplicationRecord
  belongs_to :location
  belongs_to :area, counter_cache: :locations_count

  validates :location, presence: true
  validates :area, presence: true

  accepts_nested_attributes_for :area, :reject_if => :all_blank

  default_scope -> { includes(:area).order('areas.name') }
end

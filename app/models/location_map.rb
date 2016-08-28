class LocationMap < ApplicationRecord
  belongs_to :location
  belongs_to :map
  belongs_to :admin_user, foreign_key: :user_id

  validates :location, presence: true
  validates :map, presence: true

  accepts_nested_attributes_for :location, :reject_if => :all_blank
end

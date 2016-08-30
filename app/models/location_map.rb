class LocationMap < ApplicationRecord
  belongs_to :location
  belongs_to :map
  belongs_to :admin_user, foreign_key: :user_id

  validates :location, presence: true
  validates :map, presence: true

  scope :by_order, -> { order(:order) }

  accepts_nested_attributes_for :location, :reject_if => :all_blank
end

class AreaLocation < ApplicationRecord
  belongs_to :location
  belongs_to :area

  validates :location, presence: true
  validates :area, presence: true

  accepts_nested_attributes_for :area, :reject_if => :all_blank
end

class UnavailabilityRoom < ApplicationRecord
  belongs_to :room

  validates :starts_at, presence: true
  validates :ends_at, presence: true
end

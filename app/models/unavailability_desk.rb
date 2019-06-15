class UnavailabilityDesk < ActiveRecord::Base
  belongs_to :desk
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
class Room < ActiveRecord::Base
  belongs_to :area
  has_many :unavailability_rooms
  validates :name, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
end

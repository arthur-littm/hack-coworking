class Room < ActiveRecord::Base
  belongs_to :area
  validates :name, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
end
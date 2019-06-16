class Desk < ActiveRecord::Base
  belongs_to :area
  has_many :unavailability_desks
  has_many :booking_desks
end

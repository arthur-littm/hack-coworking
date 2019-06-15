class Desk < ActiveRecord::Base
  belongs_to :area
  has_many :unavailability_desks
end
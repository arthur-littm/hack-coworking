class BookingDeskTag < ApplicationRecord
  belongs_to :booking_desk
  belongs_to :tag
end

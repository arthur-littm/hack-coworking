class BookingRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  validate :room_available?

  private

  def room_available?
    errors.add(:booking_room, "Room is not available") unless self.room.available?
  end
end
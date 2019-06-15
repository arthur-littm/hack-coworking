class BookingRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  validate :room_available?

  private

  def room_available?
    is_valid = self.room.unavailability_rooms.select do |unavailability|
      unavailability.starts_at == self.starts_at && unavailability.ends_at == self.ends_at
    end
    errors.add(:booking_room, "Room is not available") unless is_valid.empty?
  end
end

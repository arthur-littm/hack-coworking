class BookingRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :room_available?

  private

  def room_available?
    is_valid = self.room.unavailability_rooms.select do |unavailability|
      (self.starts_at - 1.second >= unavailability.starts_at && self.starts_at + 1.second <= unavailability.ends_at) || (self.ends_at + 1.second >= unavailability.starts_at && self.ends_at - 1.second <= unavailability.ends_at)
    end
    errors.add(:booking_room, "Room is not available") if is_valid.any?
  end
end

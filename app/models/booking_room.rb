class BookingRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  validate :room_available?

  private

  def desk_available?
    is_valid = self.desk.unavailability_desks.select do |unavailability|
      unavailability.starts_at == self.starts_at && unavailability.ends_at == self.ends_at
    end
    errors.add(:booking_desk, "Desk is not available") unless is_valid.empty?
  end
end

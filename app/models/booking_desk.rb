class BookingDesk < ActiveRecord::Base
  belongs_to :desk
  belongs_to :user

  # validates :starts_at
  # validates :ends_at
  validate :desk_available?

  private

  def desk_available?
    errors.add(:booking_desk, "Desk is not available") unless self.desk.available?
  end
end
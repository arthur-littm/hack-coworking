class BookingDesk < ActiveRecord::Base
  belongs_to :desk, optional: true
  belongs_to :user

  has_many :booking_desk_tags
  has_many :tags, through: :booking_desk_tags

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :desk_available?

  private

  def desk_available?
    if desk
      is_valid = self.desk.unavailability_desks.select do |unavailability|
        unavailability.starts_at == self.starts_at && unavailability.ends_at == self.ends_at
      end
      errors.add(:booking_desk, "Desk is not available") unless is_valid.empty?
    else
      return true
    end
  end
end

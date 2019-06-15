class AddDatesToBookingRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_rooms, :starts_at, :datetime
    add_column :booking_rooms, :ends_at, :datetime
  end
end

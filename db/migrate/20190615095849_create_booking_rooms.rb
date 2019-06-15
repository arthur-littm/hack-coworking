class CreateBookingRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_rooms do |t|
      t.references :user
      t.references :room
    end
  end
end

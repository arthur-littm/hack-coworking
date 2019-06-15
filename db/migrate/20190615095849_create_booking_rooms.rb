class CreateBookingRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_rooms do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
    end
  end
end

class AddPriceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_desks, :price, :float, default: 95.0
    add_column :booking_rooms, :price, :float, default: 100.0
  end
end

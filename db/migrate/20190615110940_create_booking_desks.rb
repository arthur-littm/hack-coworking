class CreateBookingDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_desks do |t|
      t.date :starts_at
      t.date :ends_at
      t.references :user, foreign_key: true
      t.references :desk, foreign_key: true
    end
  end
end

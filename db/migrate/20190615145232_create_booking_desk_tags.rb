class CreateBookingDeskTags < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_desk_tags do |t|
      t.references :booking_desk, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end

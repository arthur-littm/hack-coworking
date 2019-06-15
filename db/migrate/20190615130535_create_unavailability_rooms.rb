class CreateUnavailabilityRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailability_rooms do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end

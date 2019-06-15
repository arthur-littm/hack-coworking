class CreateUnavailabilityDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailability_desks do |t|
      t.date :starts_at
      t.date :ends_at
      t.references :desk, foreign_key: true
      t.timestamps
    end
  end
end

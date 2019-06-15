class CreateDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :desks do |t|
      t.string :name
      t.boolean :available, default: false
      t.references :area
    end
  end
end

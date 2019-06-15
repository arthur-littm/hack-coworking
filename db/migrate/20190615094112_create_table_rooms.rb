class CreateTableRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end

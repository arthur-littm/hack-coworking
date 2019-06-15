class Area < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :desk_number
      t.integer :current_population
      t.timestamps
    end
  end
end

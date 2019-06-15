class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :starts_at
      t.date :ends_at
      t.references :user, foreign_key: true
    end
  end
end

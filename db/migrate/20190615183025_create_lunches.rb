class CreateLunches < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :proposer_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end

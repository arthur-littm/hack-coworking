class RemoveBoolean < ActiveRecord::Migration[5.2]
  def change
    remove_column :desks, :available
    remove_column :rooms, :available
  end
end

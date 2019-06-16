class AddStatusToLunch < ActiveRecord::Migration[5.2]
  def change
    add_column :lunches, :status, :string, default: "pending"
  end
end

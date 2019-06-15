class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :job, :string
    add_column :users, :balance, :integer
    add_column :users, :has_dog, :boolean, default: false
  end
end

class DefaultBalanceOnCreate < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :balance, 100)
  end
end

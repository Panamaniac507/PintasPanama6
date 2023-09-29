class RemoveLastNameFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :last_name
  end
end

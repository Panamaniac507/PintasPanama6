class RemoveNameFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :name
  end
end

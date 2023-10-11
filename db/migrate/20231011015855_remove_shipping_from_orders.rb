class RemoveShippingFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :shipping
  end
end

class AddShippingToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :shipping, :float
  end
end

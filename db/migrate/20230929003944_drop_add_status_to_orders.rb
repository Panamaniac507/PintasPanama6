class DropAddStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    drop_table :add_status_to_orders
  end
end

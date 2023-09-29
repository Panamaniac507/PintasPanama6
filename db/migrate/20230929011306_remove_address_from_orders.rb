class RemoveAddressFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :address
  end
end

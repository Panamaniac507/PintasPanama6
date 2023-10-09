class RemoveItemPriceFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :item_price
  end
end

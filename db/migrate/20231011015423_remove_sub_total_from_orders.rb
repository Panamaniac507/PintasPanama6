class RemoveSubTotalFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :sub_total
  end
end

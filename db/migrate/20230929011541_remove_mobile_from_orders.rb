class RemoveMobileFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :mobile
  end
end

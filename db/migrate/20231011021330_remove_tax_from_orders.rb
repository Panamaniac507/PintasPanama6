class RemoveTaxFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :tax
  end
end

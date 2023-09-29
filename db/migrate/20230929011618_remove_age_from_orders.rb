class RemoveAgeFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :age
  end
end

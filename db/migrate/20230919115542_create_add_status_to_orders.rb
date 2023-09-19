class CreateAddStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :add_status_to_orders do |t|
      add_column :orders, :status, :integer, default:0
      t.timestamps
    end
  end
end

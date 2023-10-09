class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.decimal :sub_total
      t.decimal :shipping
      t.decimal :tax
      t.decimal :total
      t.integer :quantity

      t.timestamps
    end
  end
end

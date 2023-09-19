class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.float :sub_total
      t.float :shipping
      t.float :tax
      t.float :total
      t.text :address
      t.text :name
      t.text :last_name
      t.integer :mobile
      t.integer :age

      t.timestamps
    end
  end
end

class CreateOrderArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :order_articles do |t|
      t.references :order, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.integer :quantity
      t.float :subtotal

      t.timestamps
    end
  end
end

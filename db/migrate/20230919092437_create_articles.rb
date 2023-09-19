class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :article_description
      t.float :price
      t.integer :stock_qty

      t.timestamps
    end
  end
end

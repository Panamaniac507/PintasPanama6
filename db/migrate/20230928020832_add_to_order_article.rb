class AddToOrderArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :order_articles, :unit_price, :decimal
  end
end

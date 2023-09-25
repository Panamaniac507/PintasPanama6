class OrderArticle < ApplicationRecord
  belongs_to :order
  belongs_to :article

  # def orderArticlecreation
  #   # fix this...use params instead for security when creating an order_article, this must be a private method
  #  #also, the order_article create method should come from the order_article controller !!...Fix this!
  #   if self.article.stock_qty > 0
  #     Order_article.create!(order_id: order.id, article_id: article.id, quantity: article.order_article.quantity, subtotal: article.price * article.quantity )
  #   else
  #     p "Article is Not in Stock"
  #   end
  # end

end

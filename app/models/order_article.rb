class OrderArticle < ApplicationRecord
  belongs_to :order
  belongs_to :article

  before_save :set_unit_price
  before_save :set_total

  # def orderArticlecreation
  #   # fix this...use params instead for security when creating an order_article, this must be a private method
  #  #also, the order_article create method should come from the order_article controller !!...Fix this!
  #   if self.article.stock_qty > 0
  #     Order_article.create!(order_id: order.id, article_id: article.id, quantity: article.order_article.quantity, subtotal: article.price * article.quantity )
  #   else
  #     p "Article is Not in Stock"
  #   end
  # end

  def unit_price
    if persisted?
        self[:unit_price]
    else
        article.price
    end
  end

  def quantity
    order_article.quantity
  end

  def subtotal
    order_articles.collect{|order_article| order_article.valid? ? article.price * order_article.quantity : 0}.sum
  end

  private

  def set_unit_price
      self[:unit_price] = unit_price
  end

  def set_subtotal
    self[:subtotal] = subtotal
  end
end

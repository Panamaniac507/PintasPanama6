class Order < ApplicationRecord
  belongs_to :user
  has_many :order_articles
  has_many :articles, through: :order_articles
  enum status: %i[paid notpaid]
  validates :name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true
  validates :address, presence: true
  validates :age, presence: true, numericality: {greater_than: 17}

  #find_article selects the article to be placed in the order IF there is stock available
  def find_article
    # fix this...use params instead for security when creating an order_article, this must be a private method
   #also, the order_article create method should come from the order_article controller !!...Fix this!
    if self.article.stock_qty > 0
      order_article = Order_article.create!(order_id: order.id, article_id: article.id, quantity: order_article.quantity, subtotal: order_article.subtotal )
    else
      p "Article is Not in Stock"
    end
  end
  #subtotal calculates the subtotal based on the article selected, quantity and price of such article
  def subtotal
    find_article.quantity * find_article..price
  end

  def tax
    subtotal*0.10
  end
  #if the subtotal is greater than 20.00, then shipping is free, 5.00 otherwise
  def shipping
    if subtotal > 20.00
      0
    else
      5.00
    end
  end

  def total
    subtotal + tax + shipping
  end
end

class Order < ApplicationRecord
  belongs_to :user
  before_save :set_subtotal
  has_many :order_articles
  has_many :articles, through: :order_articles
  enum status: %i[paid notpaid]

  #find_article selects the article to be placed in the order IF there is stock available

  #subtotal calculates the subtotal based on the article selected, quantity and price of such article
  def sub_total
    order_articles.subtotal
  end

  def tax
    sub_total*0.10
  end
  #if the subtotal is greater than 20.00, then shipping is free, 5.00 otherwise
  def shipping
    if sub_total > 20.00
      0
    else
      5.00
    end
  end

  def total
    sub_total + tax + shipping
  end

  private

  def set_subtotal
    self[:total] = total
  end
end

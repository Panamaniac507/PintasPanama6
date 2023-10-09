class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # def unit_price
  #   item.price
  # end

  def sub_total
    order.collect{|order| order.valid? ? order.item.price * order.quantity : 0}.sum
  end

  def tax
    0.10 * sub_total
  end

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

end

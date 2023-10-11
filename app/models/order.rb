class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # def unit_price
  #   item.price
  # end

  def quantity
    quantity = 0
    quantity +=1
    quantity
  end

  def sub_total
    order.collect{|order| order.valid? ? order.item.price * order.quantity : 0}.sum
  end

  def shipping
    if sub_total > 20.00
      0
    else
      5.00
    end
  end

  def total
    sub_total + shipping
  end

end

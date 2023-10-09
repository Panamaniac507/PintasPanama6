class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  before_save :set_unit_price
  before_save :set_sub_total
  before_save :set_total

  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def sub_total
    order.collect{|order| order.valid? ? order.unit_price*order.quantity : 0}.sum
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

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_sub_total
    self[:sub_total] = sub_total
  end

  def set_total
    self[:total] = total * quantity
  end

end

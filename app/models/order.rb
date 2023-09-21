class Order < ApplicationRecord
  belongs_to :user
  has_many :order_articles
  enum status: %i[paid notpaid]
end

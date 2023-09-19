class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_article
end

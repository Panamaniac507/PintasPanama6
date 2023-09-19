class Article < ApplicationRecord
  has_many :order_articles, dependent: :nullify
  has_many :orders, through: :order_articles
end

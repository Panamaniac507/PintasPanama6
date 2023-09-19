class OrderArticle < ApplicationRecord
  belongs_to :order
  belongs_to :article
end

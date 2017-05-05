class InShoppingCart < ApplicationRecord
  belongs_to :producto
  belongs_to :shopping_cart
  has_one :user, through: :producto
end



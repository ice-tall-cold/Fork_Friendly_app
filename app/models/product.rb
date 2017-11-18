class Product < ApplicationRecord
    belongs_to :product_category
    has_many :user_carts
end

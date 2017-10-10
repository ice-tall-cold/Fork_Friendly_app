class User < ApplicationRecord
    has_one :user_carts
#    has_many :products
end

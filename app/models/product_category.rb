class ProductCategory < ApplicationRecord
    belongs_to :product_line
    has_many :products
    has_one :health_concern_maps
end

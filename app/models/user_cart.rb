class UserCart < ApplicationRecord
    belongs_to :product
    belongs_to :user
    
      def self.update_cart(user_id,product_id,active)
     begin
       user_cart_header = ["user_id","product_id","active"]
       user_cart = Hash[[user_cart_header, [user_id,product_id,active]].transpose]
       user_row = UserCart.create user_cart
     end
  end
  
  
end

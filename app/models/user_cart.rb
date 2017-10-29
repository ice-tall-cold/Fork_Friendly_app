class UserCart < ApplicationRecord
    belongs_to :product
    belongs_to :user
<<<<<<< HEAD
=======
    
      def self.update_cart(user_id,product_id,active)
     begin
       user_cart_header = ["user_id","product_id","active"]
       user_cart = Hash[[user_cart_header, [user_id,product_id,active]].transpose]
       user_row = UserCart.create user_cart
     end
  end
  
  
  
  
>>>>>>> af63c5d71fbae03631277d505d3a202e8cda4d8a
end

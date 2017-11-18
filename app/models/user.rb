class User < ApplicationRecord
    has_one :user_carts
    has_one :health_concerns
#    has_many :products
    before_save do
       self.Email.downcase 
    end
    validates :First_Name,  presence: true, length: { maximum: 50 }
    validates :Last_Name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :Email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
            
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end

require 'rails_helper'

RSpec.describe UserCart, type: :model do
    
      describe "Associations" do
        it "belongs to a product" do
            product = described_class.reflect_on_association(:product)
            expect(product.macro).to eq :belongs_to
        end
        
        it "belongs to an user" do
            user = described_class.reflect_on_association(:user)
            expect(user.macro).to eq :belongs_to
        end
    end
end

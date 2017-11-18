require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  describe "Associations" do
        it "belongs to product line" do
            product_line = described_class.reflect_on_association(:product_line)
            expect(product_line.macro).to eq :belongs_to
        end
        
        it "has many products" do
            products = described_class.reflect_on_association(:products)
            expect(products.macro).to eq :has_many
        end
        
        it "has one health_concern_maps" do
            healthconcernmaps = described_class.reflect_on_association(:health_concern_maps)
            expect(healthconcernmaps.macro).to eq :has_one
        end
    end
end

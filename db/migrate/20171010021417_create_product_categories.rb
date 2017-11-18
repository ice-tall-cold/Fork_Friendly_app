class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.references :product_line
      t.string :Name
      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :Name
      t.references :product_category
      t.timestamps
    end
  end
end

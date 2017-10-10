class CreateProductLines < ActiveRecord::Migration[5.1]
  def change
    create_table :product_lines do |t|
      t.string :Name
      t.timestamps
    end
  end
end

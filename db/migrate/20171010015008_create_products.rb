class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :Name
      t.string :Company_Name
      t.text :Serving_Size
      t.float :Calories
      t.float :Sat_Fat
      t.float :Sodium
      t.float :Carbs
      t.float :Sugar
      t.float :Fiber
      t.float :Protein
      t.text :Whole_Grain
      t.text :twenty_cent
      t.text :Gluten_Free
      t.text :Organic
      t.text :Phosphorus
      t.text :Soy
      t.text :Potassium
      t.text :Milk
      t.text :Egg
      t.text :Nut
      t.text :FODMAP
      t.text :Additional_Info
      t.references :product_category
      t.timestamps
    end
  end
end

class CreateHealthConcernMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :health_concern_maps do |t|
      t.string :Calorie_Friendly
      t.string :Heart_Healthy
      t.string :Sodium_Friendly
      t.string :Carb_Friendly
      t.string :Kidney_Friendly
      t.string  :Comments
      t.references :product_category
      t.timestamps
    end
  end
end

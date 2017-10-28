class CreateHealthConcerns < ActiveRecord::Migration[5.1]
  def change
    create_table :health_concerns do |t|
      t.integer :Calorie_Friendly
      t.integer :Heart_Healthy
      t.integer :Sodium_Friendly
      t.integer :Carb_Friendly
      t.integer :Kidney_Friendly
      t.references :user
      t.timestamps
    end
  end
end

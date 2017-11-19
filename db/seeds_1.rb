# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_table = User.create(First_Name: 'Sai', Last_Name: 'sankeerth', Email: 'sankeerth@tamu.edu',password: 'password',password_confirmation: 'password', Gender: 'Male',Admin: true)
user_table1 = User.create(First_Name: 'Sa', Last_Name: 'sankeert', Email: 'ankeerth@tamu.edu',password: 'password',password_confirmation: 'password', Gender: 'Male',Admin: true)
user_table2 = User.create(First_Name: 'S', Last_Name: 'ankeert', Email: 'nkeerth@tamu.edu',password: 'password',password_confirmation: 'password', Gender: 'Male',Admin: true)
user_table3 = User.create(First_Name: 'Sa', Last_Name: 'snkeert', Email: 'keerth@tamu.edu',password: 'password',password_confirmation: 'password', Gender: 'Male',Admin: true)
user_table4 = User.create(First_Name: 'Sa', Last_Name: 'sakeert', Email: 'eerth@tamu.edu',password: 'password',password_confirmation: 'password', Gender: 'Male',Admin: true)




prod_line = ProductLine.create(Name: 'Dairy', id: 1)
prod_cat = ProductCategory.create(Name: 'Yogurt',product_line_id: prod_line.id,id: 5)
prod1 = Product.create(id: 10, Name: 'WhippedYogurt', Company_Name: 'Krogers', Serving_Size: 10.0, Calories: 10.0, Sat_Fat: 10.0, Sodium: 10.0, Carbs: 10.0, Sugar: 10.0, Fiber: 10.0, Protein: 10.0, Whole_Grain: 'None', twenty_cent: 'None', Gluten_Free: 'None', Organic: 'None', Phosphorus: 'None', Soy: 'None', Potassium: 'None', Milk: 'None', Egg: 'None', Nut: 'None', FODMAP: 'None', Additional_Info: 'None', product_category_id: 5)
crn = HealthConcern.create(Calorie_Friendly: 1 ,Heart_Healthy: 0, Sodium_Friendly: 0, Carb_Friendly: 0, Kidney_Friendly: 0, user_id: 1)
map =  HealthConcernMap.create( Calorie_Friendly: "LS", Heart_Healthy: 'LS', Sodium_Friendly: 'LS', Carb_Friendly: 'LS', Kidney_Friendly: 'LS', Comments: 'LS', product_category_id: 5)

prod_cat_1 = ProductCategory.create(Name: 'Yogurt_1',product_line_id: prod_line.id,id: 6)
prod1_1 = Product.create(id: 11, Name: 'WhippedYogurt', Company_Name: 'Krogers', Serving_Size: 10.0, Calories: 10.0, Sat_Fat: 10.0, Sodium: 10.0, Carbs: 10.0, Sugar: 10.0, Fiber: 10.0, Protein: 10.0, Whole_Grain: 'None', twenty_cent: 'None', Gluten_Free: 'None', Organic: 'None', Phosphorus: 'None', Soy: 'None', Potassium: 'None', Milk: 'None', Egg: 'None', Nut: 'None', FODMAP: 'None', Additional_Info: 'None', product_category_id: 6)
crn_1 = HealthConcern.create(Calorie_Friendly: 0 ,Heart_Healthy: 1, Sodium_Friendly: 0, Carb_Friendly: 0, Kidney_Friendly: 0, user_id: 2)
map_1 =  HealthConcernMap.create( Calorie_Friendly: "LS", Heart_Healthy: 'LS', Sodium_Friendly: 'LS', Carb_Friendly: 'LS', Kidney_Friendly: 'LS', Comments: 'LS', product_category_id: 6)

prod_cat_1 = ProductCategory.create(Name: 'Yogurt_2',product_line_id: prod_line.id,id: 7)
prod1_1 = Product.create(id: 12, Name: 'WhippedYogurt', Company_Name: 'Krogers', Serving_Size: 10.0, Calories: 10.0, Sat_Fat: 10.0, Sodium: 10.0, Carbs: 10.0, Sugar: 10.0, Fiber: 10.0, Protein: 10.0, Whole_Grain: 'None', twenty_cent: 'None', Gluten_Free: 'None', Organic: 'None', Phosphorus: 'None', Soy: 'None', Potassium: 'None', Milk: 'None', Egg: 'None', Nut: 'None', FODMAP: 'None', Additional_Info: 'None', product_category_id: 7)
crn_1 = HealthConcern.create(Calorie_Friendly: 0 ,Heart_Healthy: 0, Sodium_Friendly: 1, Carb_Friendly: 0, Kidney_Friendly: 0, user_id: 3)
map_1 =  HealthConcernMap.create( Calorie_Friendly: "LS", Heart_Healthy: 'LS', Sodium_Friendly: 'LS', Carb_Friendly: 'LS', Kidney_Friendly: 'LS', Comments: 'LS', product_category_id: 7)

prod_cat_1 = ProductCategory.create(Name: 'Yogurt_3',product_line_id: prod_line.id,id: 8)
prod1_1 = Product.create(id: 13, Name: 'WhippedYogurt', Company_Name: 'Krogers', Serving_Size: 10.0, Calories: 10.0, Sat_Fat: 10.0, Sodium: 10.0, Carbs: 10.0, Sugar: 10.0, Fiber: 10.0, Protein: 10.0, Whole_Grain: 'None', twenty_cent: 'None', Gluten_Free: 'None', Organic: 'None', Phosphorus: 'None', Soy: 'None', Potassium: 'None', Milk: 'None', Egg: 'None', Nut: 'None', FODMAP: 'None', Additional_Info: 'None', product_category_id: 8)
crn_1 = HealthConcern.create(Calorie_Friendly: 0 ,Heart_Healthy: 0, Sodium_Friendly: 0, Carb_Friendly: 1, Kidney_Friendly: 0, user_id: 4)
map_1 =  HealthConcernMap.create( Calorie_Friendly: "LS", Heart_Healthy: 'LS', Sodium_Friendly: 'LS', Carb_Friendly: 'LS', Kidney_Friendly: 'LS', Comments: 'LS', product_category_id: 8)

prod_cat_1 = ProductCategory.create(Name: 'Yogurt_4',product_line_id: prod_line.id,id: 9)
prod1_1 = Product.create(id: 14, Name: 'WhippedYogurt', Company_Name: 'Krogers', Serving_Size: 10.0, Calories: 10.0, Sat_Fat: 10.0, Sodium: 10.0, Carbs: 10.0, Sugar: 10.0, Fiber: 10.0, Protein: 10.0, Whole_Grain: 'None', twenty_cent: 'None', Gluten_Free: 'None', Organic: 'None', Phosphorus: 'None', Soy: 'None', Potassium: 'None', Milk: 'None', Egg: 'None', Nut: 'None', FODMAP: 'None', Additional_Info: 'None', product_category_id: 9)
crn_1 = HealthConcern.create(Calorie_Friendly: 0 ,Heart_Healthy: 0, Sodium_Friendly: 0, Carb_Friendly: 0, Kidney_Friendly: 1, user_id: 5)
map_1 =  HealthConcernMap.create( Calorie_Friendly: "LS", Heart_Healthy: 'LS', Sodium_Friendly: 'LS', Carb_Friendly: 'LS', Kidney_Friendly: 'LS', Comments: 'LS', product_category_id: 9)

cart = UserCart.create( user_id: 1, product_id: 52, active: true)
prod = Product.create(id: 52, Name: "Kroger: Fat Free Sour Cream", Company_Name: "Kroger", Serving_Size: nil, Calories: 20.0, Sat_Fat: 0.0, Sodium: 25.0, Carbs: 3.0, Sugar: 2.0, Fiber: 0.0, Protein: 1.0, Whole_Grain: "N", twenty_cent: nil, Gluten_Free: "Y", Organic: nil, Phosphorus: "N", Soy: "N", Potassium: "60.0", Milk: "Y", Egg: "N", Nut: "N", FODMAP: "HIGH", Additional_Info: nil, product_category_id: 5)




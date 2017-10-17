# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_table = User.create(First_Name: 'Sai', Last_Name: 'sankeerth', Email: 'sankeerth@tamu.edu',password: 'password',password_confirmation: 'password', Gender: 'Male',Admin: true)

prod_line = ProductLine.create(Name: 'Bakery')
prod_cat = ProductCategory.create(Name: 'Bagel',product_line_id: prod_line.id)
prod1 = Product.create(Name: 'Boston', product_category_id: prod_cat.id)
prod2 = Product.create(Name: 'sams choice', product_category_id: prod_cat.id)


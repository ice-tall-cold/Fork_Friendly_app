class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :First_Name
      t.string :Last_Name
      t.string :Email
      t.string :Password
	  t.string :password_confirmation
      t.string :Gender
      t.boolean :Admin
      t.timestamps
    end
  end
end

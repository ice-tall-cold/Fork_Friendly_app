class CreateUserCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_carts do |t|
      t.references :user
      t.references :product
      t.boolean :active
      t.timestamps
    end
  end
end

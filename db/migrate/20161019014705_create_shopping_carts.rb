class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.string :estado
      t.string :ip

      t.timestamps
    end
  end
end

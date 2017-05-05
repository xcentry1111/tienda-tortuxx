class AddUserToInShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :in_shopping_carts, :user_id, :integer
  end
end

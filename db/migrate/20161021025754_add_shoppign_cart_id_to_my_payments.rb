class AddShoppignCartIdToMyPayments < ActiveRecord::Migration[5.0]
  def change
    add_reference :my_payments, :shopping_cart, index: true
    # se quito el foreign_key: true, y se agrego el index: true, ya que el foreign, agrega validaciones por debajo
  end
end

class ChangePrecioFromDecimalToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :productos, :precio, :integer
  end
end

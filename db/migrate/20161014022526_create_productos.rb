class CreateProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.decimal :precio, scale: 2, precision: 10
      t.text :descripcion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

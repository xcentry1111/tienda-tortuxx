class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :descripcion
      t.string :municipio
      t.string :direccion
      t.string :telefono
      t.string :nit
      t.string :pagina_web
      t.string :email
      t.string :twitter
      t.string :tipo_empresa

      t.timestamps
    end
  end
end

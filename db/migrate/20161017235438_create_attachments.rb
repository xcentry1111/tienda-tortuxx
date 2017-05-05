class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :producto, foreign_key: true
      t.attachment :archivo
      t.string :descripcion

      t.timestamps
    end
  end
end

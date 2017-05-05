class AddAttachmentImagen3ToProductos < ActiveRecord::Migration
  def self.up
    change_table :productos do |t|
      t.attachment :imagen3
    end
  end

  def self.down
    remove_attachment :productos, :imagen3
  end
end

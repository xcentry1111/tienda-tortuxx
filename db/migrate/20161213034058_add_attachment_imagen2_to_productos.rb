class AddAttachmentImagen2ToProductos < ActiveRecord::Migration
  def self.up
    change_table :productos do |t|
      t.attachment :imagen2
    end
  end

  def self.down
    remove_attachment :productos, :imagen2
  end
end

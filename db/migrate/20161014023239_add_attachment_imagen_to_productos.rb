class AddAttachmentImagenToProductos < ActiveRecord::Migration
  def self.up
    change_table :productos do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :productos, :imagen
  end
end

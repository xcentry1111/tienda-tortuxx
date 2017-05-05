class AddAttachmentImagen4ToProductos < ActiveRecord::Migration
  def self.up
    change_table :productos do |t|
      t.attachment :imagen4
    end
  end

  def self.down
    remove_attachment :productos, :imagen4
  end
end

require 'digest/md5'
class Link < ApplicationRecord
  before_create :set_defaults
  belongs_to :producto
  after_create :send_email

  has_many :link_attachments

  def is_invalid?
    (DateTime.now > self.expiration_date || self.downloads >= 5) 
  end

  def update_downloads
    self.update(downloads: self.downloads+1)
  end

  def create_attachment_links
    producto.attachments.each do |attachment|
      self.link_attachments.create(attachment:attachment)
    end
  end

  def links
    link_attachments.limit(producto.attachments.count)
  end

  private
  	def set_defaults
  		self.custom_id = Digest::MD5.hexdigest("#{DateTime.now}#{self.id}#{self.producto_id}")  #El MD% sirve para generar el link, y los datos que estan en la cadena son los que se muestran , fecha, id, y id del prodcuto
  		self.downloads ||= 0 #Asiganle 0 en caso de que download sea nill 
  	end

  	def send_email #metodo que se encarga de enviar el correo
  		LinkMailer.download_link(self).deliver_now
      #Clase LinkMailer y la accion download_link para le envio
  	end

end



class Producto < ApplicationRecord

  belongs_to :user # El producto le pertenece a un usuario
  has_many :attachments

  has_attached_file :imagen, :styles => { :medium => "750x500!", :thumb => "100x100!", :view => "270x200!", :carousel => "500x300!"  }
  validates_attachment :imagen, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :imagen2, :styles => { :medium => "750x500!", :thumb => "100x100!", :view => "270x200!", :carousel => "500x300!"  }
  validates_attachment :imagen2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :imagen3, :styles => { :medium => "750x500!", :thumb => "100x100!", :view => "270x200!", :carousel => "500x300!"  }
  validates_attachment :imagen3, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :imagen4, :styles => { :medium => "750x500!", :thumb => "100x100!", :view => "270x200!", :carousel => "500x300!"  }
  validates_attachment :imagen4, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates_presence_of :nombre, :precio  # significa que el nombre, usuario y el precio debe de existir para crearse
  validates :precio, numericality: { greater_than: 0 }   # la validacion significa que tiene que ser numero y que sea mayor a 0
  
   def paypal_form
   		{name: nombre, sku: :item, price: (precio / 100), currency:"USD", quantity:1}
   end
  
end

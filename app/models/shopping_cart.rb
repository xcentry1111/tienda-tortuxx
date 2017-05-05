class ShoppingCart < ApplicationRecord
	include AASM
	has_many :productos, through: :in_shopping_carts
	has_many :in_shopping_carts
	has_many :my_payments
	# un carrito puede tener muchos productos y u  producto puede estar en muchos carritos

	# def total
	# 	suma = 0
	# 		productos.each do |producto|
	# 			suma += producto.precio
	# 		end
	# 	return suma
	# end
	#Este es utilizando iteracion con each, recorre todo los productos

	aasm column: "estado" do 
		state :created, initial: true
		state :payed
		state :failed
		# se incluye los estados que se quieran, marcar en el campo de estado

		event :pay do
			after do
				#Todo: mandar todas las compras del usuario
				self.generate_links()
			end
			transitions from: :created, to: :payed
		end
	end

	def payment
		begin
			my_payments.payed.first
		rescue Exception => e
			return nil
		end
	end

	 def generate_links
	 	self.productos.each do |producto|
	 		Link.create(expiration_date: DateTime.now + 7.days, producto: producto,email: payment.email)
	 	end
	 end

	def items
		self.productos.map{ |producto| producto.paypal_form }	
	end

	def total
		productos.sum(:precio)
	end
	# este metodo es utilizando SQL
end


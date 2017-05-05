# class MyPayment < ApplicationRecord
# 	belongs_to :shopping_cart
# 	has_many :productos, through: :shopping_cart
# 	include AASM
# 	#incluye las libreria
# 	# se le dice con que columba se quiere marcar, en este momento esta estado en la base de datos
# 	aasm column: "estado" do 
# 		state :nopagado, initial: true
# 		state :pagado
# 		state :fallido
# 		# se incluye los estados que se quieran, marcar en el campo de estado

# 		event :pay do
# 			after do
# 				#Todo: Marcar carrito como pagado shopping_cart.pay!
# 				shopping_cart.pay!
# 			end
# 			transitions from: :nopagado, to: :pagado
# 		end
# 	end

# 	def productos_by_user(user)
# 		self.productos.where(productos:{user_id:user.id})
# 	end
# end

class MyPayment < ActiveRecord::Base
	belongs_to :shopping_cart
	has_many :productos, through: :shopping_cart
	include AASM

	aasm column: "estado" do
		state :created, initial: true
		state :payed
		state :failed

		event :pay do
			after do
				shopping_cart.pay!
			end
			transitions from: :created, to: :payed
		end
	end

	def productos_by_user(user)
		self.productos.where(productos:{user_id:user.id})
	end
end


# class MyPayment < ActiveRecord::Base
# 	belongs_to :shopping_cart
# 	has_many :productos, through: :shopping_cart
# 	include AASM

# 	aasm column: "status" do
# 		state :created, initial: true
# 		state :payed
# 		state :failed

# 		event :pay do
# 			after do
# 				shopping_cart.pay!
# 			end
# 			transitions from: :created, to: :payed
# 		end

# 	end


# 	def productos_by_user(user)
# 		self.productos.where(productos:{user_id:user.id})
# 	end
# end

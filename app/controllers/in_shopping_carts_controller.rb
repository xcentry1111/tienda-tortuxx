class InShoppingCartsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def create
		#Agregar a un carrito de compra
		in_shopping_cart = InShoppingCart.new(producto_id: params[:producto_id],
											  									shopping_cart: @shopping_cart,
											  									user_id: is_admin)
		if in_shopping_cart.save
			redirect_to carrito_path, notice: "Guardamos el producto en tu carrito"
		else
			redirect_to productos_path(id: params[:producto_id]), notice: "No pudimos agregar al carrito, intenta de nuevo"
		end
	end

	def destroy
		#Eliminar de un carrito de compra
		@in_shopping_cart = InShoppingCart.find(params[:id])
		@in_shopping_cart.destroy
		redirect_to carrito_path
	end
end

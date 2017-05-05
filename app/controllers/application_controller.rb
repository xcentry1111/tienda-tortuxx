class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_shopping_cart

  helper_method :is_admin
  def is_admin
    return current_user.id
  end

  private
  #El metodo se encarga de controlar el carrito de compras, de guardarlos en una session
  def set_shopping_cart
  	#Valida si no tiene un carrito de compras, entonces si no se tiene se crea uno
  	if cookies[:shopping_cart_id].blank?
  		@shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
  		cookies[:shopping_cart_id] = @shopping_cart.id
  	else
  		@shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
  	end
  rescue ActiveRecord::RecordNotFound => e
  		@shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
  		cookies[:shopping_cart_id] = @shopping_cart.id
  end
end


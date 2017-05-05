class CreativesController < ApplicationController
   layout :determine_layout 

   def index
    #@orders = current_user.orders.order("created_at desc")
    @productos = Producto.all.order("created_at").last
  end


  def noregistro
  	#render layout: "lading"
  end

   def comprados
     @compras = InShoppingCart.where("shopping_cart_id in (select id from shopping_carts where estado = 'payed') and user_id = #{is_admin}")
   end

  def payment_succed
    if @shopping_cart.payed?
       cookies[:shopping_cart_id] = nil
    else
      redirect_to carrito_path
    end
  end

 private
 

  def determine_layout
    if ['noregistro'].include?(action_name)
       "application"
     elsif ['index','payment_succed','comprados'].include?(action_name)
       "proyecto"
     end
   end
end

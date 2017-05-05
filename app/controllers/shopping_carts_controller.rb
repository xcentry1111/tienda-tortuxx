class ShoppingCartsController < ApplicationController
	 layout :determine_layout
   before_action :authenticate_user!, only: [:show]

  def show
    if @shopping_cart.payed?
      render "shopping_carts/complete"
      return
    end
  end

	private
    def determine_layout
    if [''].include?(action_name)
      "application"
    elsif ['show'].include?(action_name)
      "proyecto"
    end
  end
end


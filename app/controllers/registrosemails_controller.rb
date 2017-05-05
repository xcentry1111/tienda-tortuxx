class RegistrosemailsController < ApplicationController

   def create
  	@email = Registrosemail.new(email: params[:email])
  	if @email.save
  		#render json: @email
  		redirect_to root_path
  	else
  		#render json: @email.errors, status: :unproccesable_entity
  		flash.now[:alert] = "El correo se encuentra ya creado o tiene inconsistencia con el correo"
  		redirect_to root_path
  	end
  end
end

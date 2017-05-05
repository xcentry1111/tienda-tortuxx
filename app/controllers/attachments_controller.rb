class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attachment, only: [:destroy,:show]
  before_action :set_producto,only: [:destroy]
  before_action :authenticate_owner!, except: :show
  
  
  def show
    send_file @attachment.archivo.path
  end

  def new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save 
      redirect_to @attachment.producto,notice: "Se guardo el archivo adjunto"
    else
      redirect_to @producto, notice: "No pudimos guardar el archivo adjunto"
    end
  end

  def destroy
    @attachment.destroy
    redirect_to @producto
  end  

  private

    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def set_producto
      @producto = @attachment.producto
    end

    def authenticate_owner!
      if params.has_key? :attachment
        @producto = Producto.find(params[:attachment][:producto_id])
      end

      if @producto.nil? || @producto.user != current_user
        redirect_to root_path, notice: "No puedes editar ese producto"
        return
      end
    end

    def attachment_params
      params.require(:attachment).permit(:producto_id,:archivo, :descripcion)
    end
end


# class AttachmentsController < ApplicationController
#   before_action :authenticate_user!
#   before_action :set_attachment, only: [:destroy, :show]
#   before_action :set_producto, only: [:destroy]
#   before_action :authenticate_owner!, except: :show

#   def new
#   end

#   def show
#     # con send_file, sirve para descagar el archivo, mas no visualizarlo
#     send_file @attachment.archivo.path  
#   end

#   def create
#   	@attachment = Attachment.new(attachment_params)
#   	if @attachment.save
#   		redirect_to @attachment.producto,notice: "Se guardo el Archivo Adjunto Correctamente"
#   	else
#   		redirect_to @producto, notice: "No se pudo guardar el archivo"
#   	end
#   end

#   def destroy
#     @attachment.destroy
#     flash[:notice] = "Borrado con exito"
#     respond_to do |format|
#       format.html { redirect_to(@producto) }
#       format.xml  { head :ok }
#     end
#   end


#  private

#  def set_attachment
#   @attachment = Attachment.find(params[:id]) 
#  end

#  def set_producto
#    @producto = @attachment.producto
#  end

#  #metodo privado, si no es el usuario que lo creo, no puede editar le producto.
#   def authenticate_owner!
#     if params.has_key? :attachment
#     	@producto = Producto.find(params[:attachment][:producto_id])
#     end

#   	if @producto.nil? || @producto.user != current_user
#   		redirect_to root_path, notice: "No puedes editar este Proeducto"
#   		return
#   	end
#   end

#   def attachment_params
#   	params.require(:attachment).permit(:producto_id, :archivo, :descripcion)
#   end 
# end

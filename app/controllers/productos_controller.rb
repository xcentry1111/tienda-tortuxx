class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :index_all, :views] # sirve para que se tenga que autenticar, menos el index, y el show
  #layout "proyecto" 
  layout :determine_layout

  def index 
    @productos = Producto.where("user_id = #{is_admin}")
  end

  def index_all
    @productos = Producto.all.order("created_at desc")
    @sliders = Producto.last(4)
  end

  def views
    @producto = Producto.find(params[:id])
  end


  def show
     if user_signed_in? and current_user == @producto.user and !params.has_key?(:cliente) 
      ## valiacion, que se encarga de  vlidar si es el dueño del producto, lo deja ingresar
       @attachment = Attachment.new
       render :admin
     end
  end

  def new
    @producto = Producto.new
  end

  def edit
  end

  def create
    @producto = Producto.new(producto_params)
    @producto.user = current_user
    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_producto
      @producto = Producto.find(params[:id])
    end

    def producto_params
      params.require(:producto).permit(:nombre, :precio, :descripcion, :imagen, :imagen2, :imagen3, :imagen4)
    end

    def determine_layout
    if [''].include?(action_name)
      "application"
    elsif ['index','edit','show','new','index_all', 'views'].include?(action_name)
      "proyecto"
    end
  end
end

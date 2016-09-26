# Clase donde se realizan las compras
# @author Luis Jose Padilla Benitez

class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /buys
  # GET /buys.json
  # Página principal buys, se muestran las categorias para que el usuario pueda
  # seleccionar artículos, también se muestra el carrito.
  def index
    @buys = Buy.all
    @categories = Category.all.where(:activo => 1)
  end
=begin
  # GET /buys/1
  # GET /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: 'Buy was successfully created.' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: 'Buy was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: 'Buy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end
  
  # Dependiendo de la categoria seleccionada se realiza consulta a la tabla
  # articulos para desplegar los articulos de la categoria.
  def categories
    @categories = Category.all.where(:activo => 1);
    @items = Item.where(:category_id => params[:category_id], :activo => 1)
  end
  
=begin  
  def compra_correcta
    #file = File.read("prueba#{current_user.id}.json")
    #datosCompra = JSON.parse(file)
    #datosCompra.each { |item|
    #  @buys = Buy.new(:user_id => current_user.id, :item_id => item['id'], :item_nombre => item['nombre'], :item_precio => item['precio'], :item_cantidad => item['cantidad'])
    #  @buys.save
    #}
  end
  
  def notificaciones
    
  end
=end
  # Se genera un archivo con el json del carrito de compras que se usara cuando
  # se obtenga una respuesta de PayPal
  def generar_archivo
    respond_to do |format|
      file = File.new("prueba#{current_user.id}.json", 'w')
      if file
        file.write(params[:jsonDatos])
        file.close
        format.json { render json: {status: 'OK'} }
      else
        format.json { render json: {status: 'ERROR'} }
      end
    end
  end
  
  # Muestra los registros de las compras realizadas por el usuario
  # Solo muestra las compras del usuario de la sesión.
  def registro_compras
    if params[:user_id] != current_user.id.to_s
      redirect_to root_path, alert: 'Usuario no valido'
    end
    @buys = Buy.where(:user_id => current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      if params[:id].nil?
        @buy = Buy.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(:user_id, :item_id, :category_id, :jsonDatos)
    end
end

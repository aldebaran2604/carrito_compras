# Se realizan altas bajas consultas de artículos.
# @author Luis Jose Padilla Benitez

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  # GET /items
  # GET /items.json
  # Muestra todos los artículos registrados solo del usuario de la sesión.
  def index
    @items = Item.all.where(:user_id => current_user.id, :activo => 1)
  end

  # GET /items/1
  # GET /items/1.json
  # Muestra solo un artículo.
  def show
  end

  # GET /items/new
  # Crea un nuevo artículo.
  def new
    @item = Item.new
    @categories = Category.all.where(:activo => 1)
    @categoryselected = 0
  end

  # GET /items/1/edit
  # Se actualiza un artículo.
  def edit
    @categories = Category.all.where(:activo => 1)
    auxcategoryselected = Item.where(:id => params[:id] )
    @categoryselected = auxcategoryselected[0].category_id
  end

  # POST /items
  # POST /items.json
  # Guarda el artículo creado en la base de datos.
  def create
    @categories = Category.all
    @categoryselected = 0
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.category_id = params[:category_id]
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Artículo guardado.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  # Actualiza los datos del artículo en la base de datos.
  def update
    respond_to do |format|
      @item.category_id = params[:category_id]
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Artículo actualizado.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        @categories = Category.all
        auxcategoryselected = Item.where(:id => params[:id] )
        @categoryselected = auxcategoryselected[0].category_id
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  # Elimina de la base de datos un artículo.
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Artículo eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @itemvalid = Item.find_by_id(params[:id])
      if @itemvalid.nil? || @itemvalid.user_id != current_user.id
        redirect_to root_path, notice: 'No existe el articulo o no tiene permisos para acceder.'
      else
        @item = Item.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:category_id, :nombre, :cantidad, :precio, :cover)
    end
end

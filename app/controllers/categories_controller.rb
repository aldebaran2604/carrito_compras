# Se realizan altas bajas consultas de las categorias.
# @author Luis Jose Padilla Benitez

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  #load_and_authorize_resource
  
  # GET /categories
  # GET /categories.json
  # Muestra todas las categorias existente.
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  # Muestra solo una categoria.
  def show
  end

  # GET /categories/new
  # Crea una nueva categoria
  def new
    @category = Category.new
    @subcategories = SubCategory.all
    @subselected = []
  end

  # GET /categories/1/edit
  # Se editan los valores de la categoria.
  def edit
    @subcategories = SubCategory.all
    #@subselected = []
    #subcategories = HasCategory.where(:category_id => params[:id])
    #subcategories.each do |subcategory_id|
    #  @subselected[subcategory_id.sub_category_id] = subcategory_id.sub_category_id
    #end
  end

  # POST /categories
  # POST /categories.json
  # Guarda la categoria en la base de datos.
  def create
    @category = Category.new(category_params)
    #@category.sub_categories = params[:subcategories]
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Categoria guarda.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  # Actualiza lso datos de una categoria en la base de datos.
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Categoria actualizada.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  # Se elimina una categoria de la base de datos.
  def destroy
    @item = Item.where(:category_id => params[:id])
    if @item.count == 0
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Categoria eliminada.' }
        format.json { head :no_content }
      end
    elsif @item.count > 0
      redirect_to categories_url, alert: 'Categoria no eliminada porque tiene articulos relacionados.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:nombre, :descripcion, :subcategories)
    end
end

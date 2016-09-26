# Se realizan altas bajas consultas de sub categorias.
# Este modulo no esta en funcionamiento.
# @author Luis Jose Padilla Benitez

class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  #load_and_authorize_resource
  
  # GET /sub_categories
  # GET /sub_categories.json
  # Se muestran todas las subacategorias creadas.
  def index
    @sub_categories = SubCategory.all
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.json
  # Se muestan los datos de un sub categoria.
  def show
  end

  # GET /sub_categories/new
  # Se crea una sub categoria.
  def new
    @sub_category = SubCategory.new
  end

  # GET /sub_categories/1/edit
  # Se editan los datos de una sub categoria.
  def edit
  end

  # POST /sub_categories
  # POST /sub_categories.json
  # Guarda los datos de la sub categoria creada en la base de datos.
  def create
    @sub_category = SubCategory.new(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to @sub_category, notice: 'Sub category was successfully created.' }
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categories/1
  # PATCH/PUT /sub_categories/1.json
  # Actualiza los datos de una sub categoria en la base de datos.
  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to @sub_category, notice: 'Sub category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.html { render :edit }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.json
  # Elimina de la base de datos una sub categoria.
  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to sub_categories_url, notice: 'Sub category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_category_params
      params.require(:sub_category).permit(:nombre, :descripcion)
    end
end

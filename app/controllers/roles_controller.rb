# Se realizan altas bajas consultas de roles.
# Este modulo no esta en funcionamiento.
# @author Luis Jose Padilla Benitez

class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /roles
  # GET /roles.json
  # Se muestran todos los roles generados.
  def index
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  # Muestra datos de un rol.
  def show
  end

  # GET /roles/new
  # Crea un nuevo rol.
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  # Edita los datos de un rol.
  def edit
  end

  # POST /roles
  # POST /roles.json
  # Guarda los datos de un rol en la base de datos.
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  # Guarda los datos actualizados de un rol en la base de datos.
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  # Elimina de la base de datos un rol.
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:nombre)
    end
end

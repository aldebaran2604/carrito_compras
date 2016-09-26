# Se realizan altas actualizaciones de perfil de usuario.
# @author Luis Jose Padilla Benitez

class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

=begin
  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
  end
=end
  # GET /user_profiles/new
  # Crea un perfil de usuario.
  def new
    #raise @userprofilemenu.nil?.to_yaml
    if @userprofilemenu.nil?
      @user_profile = UserProfile.new
    else
      redirect_to edit_user_profile_path(@userprofilemenu), notice: 'User profile was successfully created.'
    end
  end

  # GET /user_profiles/1/edit
  # Edita los datos de un perfil de usuario.
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  # Guarda los datos del perfil de usuario en la base de datos.
  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id
    
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to edit_user_profile_path(@user_profile), notice: 'User profile was successfully created.' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  # Actualiza los datos de un perfil de usuario en la base de datos.
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to edit_user_profile_path(@user_profile), notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
=begin
  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      if !@userprofilemenu.nil? && @userprofilemenu.id.to_s == params[:id]
        @user_profile = UserProfile.find(params[:id])
      else
        redirect_to root_path, notice: 'User profile was successfully created.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :domicilio)
    end
end

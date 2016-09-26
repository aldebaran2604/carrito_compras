require 'socket'
# Todos los controladores eredan de esta clase
# @author Luis Jose Padilla Benitez

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # load_and_authorize_resource
  # Se manda llamar al metodo set_user_profile_menu
  before_action :set_user_profile_menu
  
  # Redirecciona a la página principal si el usuario no tiene permisos. 
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    redirect_to root_url
  end
  
  # Se obtienen los datos del perfil de usuario si es que tiene perfil.
  def set_user_profile_menu
    unless current_user.nil?
      @userprofilemenu = UserProfile.find_by_user_id(current_user.id)
    end
  end
end

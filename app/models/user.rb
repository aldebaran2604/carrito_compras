# Modelo User para insertar actualizar datos de la tabla users.
# la tabla users es unsada para los accesos a la aplicación.
# @author Luis Jose Padilla Benitez

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :buy
  has_one :user_profile
  has_many :items
  
  before_save :agregar_id_rol
    
  private
    def agregar_id_rol
      self.role_id = 1
    end
end

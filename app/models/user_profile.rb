# Modelo UserProfile para insertar actualizar datos de la tabla user_profiles.
# @author Luis Jose Padilla Benitez

class UserProfile < ActiveRecord::Base
  belongs_to :user
  validates :nombre,
    presence: {
      message: "No pueden ser vacio"
    },
    length: {
      minimum: 4,
      maximum: 50,
      message: "La longitud tiene que ser mayor o igual a 4 y menor o igual a 50" 
    }
    
  validates :apellido_paterno, :apellido_materno,
    presence: {
      message: "No pueden ser vacio"
    },
    length: {
      minimum: 4,
      maximum: 60,
      message: "La longitud tiene que ser mayor o igual a 4 y menor o igual a 60" 
    }
    
  validates :fecha_nacimiento,
    presence: {
      message: "No pueden ser vacio"
    }
  
  validates :domicilio,
    presence: {
      message: "No pueden ser vacio"
    }
end

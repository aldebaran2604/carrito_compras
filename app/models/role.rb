# Modelo Role para insertar actualizar eliminar datos de la tabla roles.
# @author Luis Jose Padilla Benitez

class Role < ActiveRecord::Base
  validates :nombre, presence: true
  has_many :users
end

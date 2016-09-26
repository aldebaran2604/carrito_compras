# Modelo Buy para insertar actualizar eliminar datos de la tabla buys
# @author Luis Jose Padilla Benitez

class Buy < ActiveRecord::Base
  belongs_to :user
end

# Modelo HasCategory para insertar actualizar eliminar datos de la tabla has_category
# este modelo enlaza con categorias y subcategorias.
# @author Luis Jose Padilla Benitez

class HasCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
end

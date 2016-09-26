# Modelo SubCategory para insertar actualizar eliminar datos de la tabla sub_categories.
# @author Luis Jose Padilla Benitez

class SubCategory < ActiveRecord::Base
  has_many :has_categories
  has_many :categories, through: :has_categories
end

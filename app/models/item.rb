# Modelo Item para insertar actualizar eliminar datos de la tabla items.
# @author Luis Jose Padilla Benitez

class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :buy
  
  has_attached_file :cover,
    styles: {
      medium: "600x400",
      thumb: "400x200",
      mini: "200x100"
    }
  
  validates_attachment_content_type :cover,
    content_type: /\Aimage\/.*\Z/
  
  validates :nombre,
    presence: {
      message: "No pueden ser vacio"
    },
    length: {
      minimum: 4,
      maximum: 170,
      message: "La longitud tiene que ser mayor o igual a 4 y menor o igual a 170" 
    }
  
  validates :precio,
    presence: {
      message: "No pueden ser vacio"
    },
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 300,
      message: "Tiene que ser mayor o igual a 0 y menor o igual a 300"
    }
  
  validates :cantidad,
    presence: {
      message: "No pueden ser vacio"
    },
    numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 300,
      message: "Tiene que ser mayor o igual a 1 y menor o igual a 300"
    }
  
  validates :category_id,
    presence: {
      message: "Categoria no pueden ser vacia"
    }
  
  validates_attachment :cover,
    presence: {
      message: "Imagen no pueden ser vacia"
    }
end

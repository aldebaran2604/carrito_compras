# Modelo Category para insertar actualizar eliminar datos de la tabla categories
# @author Luis Jose Padilla Benitez

class Category < ActiveRecord::Base
  has_many :has_categories
  has_many :sub_categories, through: :has_categories
  has_many :items
  
  #after_create :save_sub_categories
  #before_destroy :destroy_sub_categories
  
  validates :nombre,
    presence: {
      message: "No pueden ser vacio"
    },
    length: {
      minimum: 4,
      maximum: 100,
      message: "La longitud tiene que ser mayor o igual a 4 y menor o igual a 100" 
    }
  validates :descripcion,
    length: {
      minimum: 0,
      maximum: 250,
      message: "La longitud tiene que ser mayor o igual a 0 y menor o igual a 250" 
    }
  #validates :subcategories, presence: true
  
  #def sub_categories=(sub_categories)
  #  @subcategories = sub_categories
  #end
  
  private
    #def save_sub_categories
    #  raise params.to_yaml
    #  unless @subcategories.nil?
    #    @subcategories.each do |subcategory_id|
    #      HasCategory.create(sub_category_id: subcategory_id, category_id: self.id)
    #    end
    #  end
    #end
    
    #def destroy_sub_categories
    #  @subcategories = HasCategory.where(category_id: self.id)
    #  @subcategories.each do |sub_category|
    #    sub_category.destroy
    #  end
    #  raise @prueba.to_yaml
    #end
end

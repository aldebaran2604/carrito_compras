# Se obtiene la respuesta de PayPal
# @author Luis Jose Padilla Benitez

class ComprasController < ApplicationController
  before_filter :authenticate_user!
  
  # Cuando en PayPal se realiza una compra correcta se manda una respuesta
  # al metodo compra_correcta lee el archivo con el json del carrito y guarda
  # los datos en la tabla buys y realiza actualizaciones a la tabla de items
  def compra_correcta
    if File.exist?("prueba#{current_user.id}.json")
      file = File.read("prueba#{current_user.id}.json")
      datosCompra = JSON.parse(file)
      datosCompra.each { |index,item|
        user_id = current_user.id
        item_id = item['id']
        item_nombre = item['nombre']
        item_precio = item['precio']
        item_cantidad = item['cantidad']
        @item = Item.find_by_id(item_id)
        
        @item.save
        if @item['cantidad']-1 == 0
          @item.update_attribute('cantidad', 0)
        else
         @item.update_attribute('cantidad', @item['cantidad']-1)
        end
        #raise @item['cantidad'].to_yaml
        #raise @item['cantidad'].to_yaml
        @buys = Buy.new(
          :user_id => user_id, 
          :item_id => item_id.to_i, 
          :item_nombre => item_nombre, 
          :item_precio => item_precio, 
          :item_cantidad => @item['cantidad']
        )
        @buys.save
      }
      File.delete("prueba#{current_user.id}.json")
      flash[:notice] = "Compra realizada con exito."
    else
      flash[:notice] = "No existen datos de compra."
    end
  end
  
  # Se obtienen las notificaciones de PayPal.
  def notificaciones
  end
end

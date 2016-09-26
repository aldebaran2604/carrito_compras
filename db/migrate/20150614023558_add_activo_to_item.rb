class AddActivoToItem < ActiveRecord::Migration
  def change
    add_column :items, :activo, :boolean, :default => true
  end
end

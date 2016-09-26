class AddActivoToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :activo, :boolean, :default => true
  end
end

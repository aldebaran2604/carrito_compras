class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end

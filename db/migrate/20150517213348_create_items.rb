class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.integer :cantidad
      t.decimal :precio

      t.timestamps null: false
    end
  end
end

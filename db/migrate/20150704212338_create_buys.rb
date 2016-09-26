class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :item_id
      t.string :item_nombre
      t.decimal :item_precio
      t.integer :item_cantidad

      t.timestamps null: false
    end
  end
end

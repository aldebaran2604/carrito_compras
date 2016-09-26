class CreateHasCategories < ActiveRecord::Migration
  def change
    create_table :has_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.references :sub_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

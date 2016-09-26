class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.date :fecha_nacimiento
      t.string :domicilio

      t.timestamps null: false
    end
  end
end

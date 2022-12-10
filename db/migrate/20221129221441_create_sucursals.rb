class CreateSucursals < ActiveRecord::Migration[7.0]
  def change
    create_table :sucursals do |t|
      t.string :nombre, null: false, uniqueness: true
      t.string :direccion, null: false
      t.integer :telefono, null: false

      t.timestamps
    end
    add_index :sucursals, :nombre, unique: true
  end
end

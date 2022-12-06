class CreateTurnos < ActiveRecord::Migration[7.0]
  def change
    create_table :turnos do |t|
      t.date :fecha
      t.time :hora
      t.string :motivo
      t.string :estado
      t.integer :sucursal_id, null: false
      t.integer :cliente_id, null: false
      t.integer :personal_id
      t.timestamps
    end
  end
end

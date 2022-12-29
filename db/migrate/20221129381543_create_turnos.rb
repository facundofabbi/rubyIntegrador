class CreateTurnos < ActiveRecord::Migration[7.0]
  def change
    create_table :turnos do |t|
      t.references :sucursal, null: false, foreign_key:true
      t.references :cliente, null: false, foreign_key:{to_table: :usuarios}
      t.references :personal, null: true, foreign_key:{to_table: :usuarios}
      t.date :fecha
      t.time :hora
      t.string :motivo
      t.string :estado
      t.string :comentario
      t.timestamps
    end
  end
end

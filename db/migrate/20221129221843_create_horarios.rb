class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.string :dia, null: false
      t.time :hora_inicio
      t.time :hora_fin
      t.integer :sucursal_id, null: false

      t.timestamps
    end
  end
  
end

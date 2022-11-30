class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.references :sucursal, null: false, foreing_key: true
      t.string :dia, null: false
      t.time :hora_inicio
      t.time :hora_fin

      t.timestamps
    end
    add_index :horarios, [:sucursal_id, :dia], unique: true
  end
  
end

class CreateComentarios < ActiveRecord::Migration[7.0]
  def change
    create_table :comentarios do |t|
      t.references :turno, null: false, foreign_key:true
      t.references :personal, null: true, foreign_key:{to_table: :usuarios}
      t.string :texto

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :artista
      t.string :lugar
      t.datetime :fecha_evento
      t.string :descripcion
      t.datetime :fecha_cierre

      t.timestamps
    end
  end
end

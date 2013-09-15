class ChangeTypeDescripcion < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.change :descripcion, :text
    end
  end
end

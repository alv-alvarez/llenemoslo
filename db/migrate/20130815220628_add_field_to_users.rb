class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rut, :string
    add_column :users, :fecha_nacimiento, :date
  end
end

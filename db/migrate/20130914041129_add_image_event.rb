class AddImageEvent < ActiveRecord::Migration
  def change
    add_attachment :events, :imagen
  end
end

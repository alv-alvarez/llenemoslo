ActiveAdmin.register Event, :as => "Eventos" do
  config.filters = false
  
  controller do
    def permitted_params
      params.permit eventos: [:artista, :fecha_evento, :lugar ,:descripcion, :fecha_cierre, :imagen, :category_id]
    end  
  end

  index do
    column :artista
    column :lugar
    column :fecha_evento
    column :fecha_cierre
    column :descripcion
    #column :category do |event|
    #    event.category.nombre
    #  end
    column :imagen do |event|
      image_tag(event.imagen.url(:thumb))
    end
    default_actions
  end

  show do
    attributes_table do
      row :artista
      row :lugar
      row :fecha_evento
      row :fecha_cierre
    #  row :category do |event|
    #    event.category.nombre
    #  end
      row :imagen do |event|
        image_tag(event.imagen.url(:thumb))
      end
      row :descripcion
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Detalles" do
      f.input :artista
      f.input :lugar
      f.input :fecha_evento, :as => :datepicker
      f.input :fecha_cierre, :as => :datepicker
      f.input :descripcion
      f.input :category
      f.input :imagen, :as => :file
    end
    f.buttons
  end
end
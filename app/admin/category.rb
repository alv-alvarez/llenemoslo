ActiveAdmin.register Category, :as => "Categorias" do
  config.filters = false

  controller do
    def permitted_params
      params.permit categorias: [:nombre]
    end
  end

  index do
    column :nombre
    default_actions
  end

  show do
    attributes_table do
      row :nombre
    end
  end

  form do |f|
    f.inputs "Detalles" do
      f.input :nombre
    end
    f.buttons
  end

end

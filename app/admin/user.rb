ActiveAdmin.register User,  :as => "Usuarios" do
  config.filters = false
  
  controller do
    def permitted_params
      params.permit usuarios: [:email, :nombre, :rut ,:fecha_nacimiento]
    end  
  end

  #menu :if => proc{ current_admin_user.can_edit_posts? }
  index do
    column :email
    column :nombre
    column :rut
    column :fecha_nacimiento
    default_actions
  end

  show do
    attributes_table do
      row :email
      row :nombre
      row :rut
      row :fecha_nacimiento
    end
  end

  form do |f|
    f.inputs "Detalles" do
      f.input :email
      f.input :nombre
      f.input :rut
      f.input :fecha_nacimiento, :as => :datepicker
      f.input :roles, :as => :select
    end
    f.buttons
  end

end

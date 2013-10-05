class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  def authenticate_admin_user!
    authenticate_user! 
    unless current_user.has_role?(:admin)
      flash[:alert] = "Esta area esta restringida para administradores."
      redirect_to root_path 
    end
  end
 
  def current_admin_user
    return nil if user_signed_in? && !current_user.has_role?(:admin)
    current_user
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:nombre, :email, :password, :password_confirmation, :roles)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:nombre, :rut, :fecha_nacimiento, :email)}
  end
end

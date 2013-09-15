class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:nombre, :email, :password, :password_confirmation, :roles)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:nombre, :rut, :fecha_nacimiento, :email)}
  end
end

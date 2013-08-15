class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)

    params[:user].delete(:current_password)

    successfully_updated = @user.update_without_password(devise_parameter_sanitizer.for(:account_update))
    
    if successfully_updated
      set_flash_message :notice, :updated
      
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

end


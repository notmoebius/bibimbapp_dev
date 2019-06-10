class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth, :gender)}
    # devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :is_alive, :email, :password, :password_confirmation, :avatar, :birthday)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :date_of_birth, :gender, :avatar, :id_admin?, :level_id)}
  end

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    profile_path
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    edit_user_registration
  end
end

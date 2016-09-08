class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :staff_id, :email, :password, :password_confirmation, :position, :role])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :staff_id, :email, :password, :password_confirmation, :position, :role])
  end

  def after_sign_in_path_for(user)
    user_home_path
  end

  def after_sign_out_path_for(user)
    new_user_session_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end

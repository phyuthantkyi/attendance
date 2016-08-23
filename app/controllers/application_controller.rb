class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

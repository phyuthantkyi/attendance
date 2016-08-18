class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user_home_path
  end

  def after_sign_out_path_for(user)
    new_user_session_path
  end

end

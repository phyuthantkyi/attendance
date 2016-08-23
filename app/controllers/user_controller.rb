class UserController < ApplicationController
  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  before_filter :authorize_admin, only: :create
  def home
  
  end

  def new

  end

  def edit

  end

  def home
  end
  private
    def authorize_admin
      return unless !current_user.admin?
      redirect_to new_user_session_path, alert: 'Admin Only!'
    end
end

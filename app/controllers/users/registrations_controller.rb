class Users::RegistrationsController < Devise::RegistrationsController
  #before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication


  # def check_permissions
  #   authorize! :create, resource
  # end

  def after_update_path_for(user)
    user_home_path
  end

  def create
    member_params = params[:user].permit(:name, :staff_id, :email, :password, :password_confirmation, :position, :role) if params[:user]
    @member = User.new(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to user_home_path, notice: 'User are created'}
      else
        format.html　{ render :new }
      end
    end
   end
end

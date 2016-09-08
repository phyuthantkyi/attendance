class UserController < ApplicationController
  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  #before_filter :authorize_admin, only: :create
  before_action :set_user, only: [:show, :edit, :update, :destroy] # probably want to keep using this
  #before_filter :ensure_admin!
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], :per_page => 2)
  end

  # # GET /users/1
  # # GET /users/1.json
  def show

  end

  # GET /users/1/edit
  def edit

  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!
    redirect_to '/user', :notice => "Staff has been deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :staff_id, :email, :password, :password_confirmation, :position, :role)
    end

  # private
  #   def authorize_admin
  #     return unless !current_user.admin?
  #     redirect_to new_user_session_path, alert: 'Admin Only!'
  #   end
  #
  #   def ensure_admin!
  #     unless current_user.admin?
  #       sign_out current_user
  #
  #       redirect_to user_session_path
  #
  #       return false
  #     end
  #   end

end

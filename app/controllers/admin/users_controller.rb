class Admin::UsersController < ApplicationController
  before_filter :user_is_admin?
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    p = user_params
    p.delete(:password) if p[:password].blank?
    p.delete(:password_confirmation) if p[:password_confirmation].blank?
    
    if @user.update_attributes(p)
      flash[:notice] = "User updated successfully."
    end
    
    render :edit
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted successfully."
    redirect_to admin_users_url
  end
  
  private
    def user_params
      params.require(:user).permit(:login, :email, :password, :password_confirmation, :first_name, :last_name, :level)
    end
  
end

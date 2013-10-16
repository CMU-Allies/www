class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    user_params = params.require(:user).permit(:login, :first_name, :last_name, :level, :email)
    if params[:user][:password].empty?
      user_params = user_params.permit(:login, :first_name, :last_name, :level, :email, :password, :password_confirmation)
    end
    
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to users_url
    else
      render "show"
    end
  end
  
  
end

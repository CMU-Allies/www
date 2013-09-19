class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
	before_filter :login_required
  

  # render new.rhtml
  def new
    redirect_to :root and return unless admin?
		@user = User.new
  end

  def index
    unless admin?
      redirect_to :root
    else
      @users = User.all
    end
  end

  def show
    @user = self.current_user
  end

  def edit_info
    @user = self.current_user
  end

	def update_info
		@user = self.current_user

		if @user.update_attributes(params[:user])
			flash[:notice] = 'User profile successfully updated'
			redirect_to(:action => :show)
		else
			render :action => :edit_info
		end
	end

  def change_password
    @user = self.current_user
  end

  def update_password
    @user = self.current_user
    if @user.authenticated?(params[:old_password]) &&
        params[:password] == params[:password_confirmation]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      if @user.save
        flash[:notice] = 'Password updated'
        redirect_to(:action => :show)
      end
    else
      flash[:notice] = 'Old password was incorrect or passwords didn\'t match'
      render :action => :change_password
    end
  end

	def edit
    redirect_to(:action => :edit_info) unless admin?
		@user = User.find(params[:id])
	end

	def update
    unless admin?
      redirect_to(:action => :edit_info)
    else
      @user = User.find(params[:id])
      @user.update_attribute(:admin, params[:user][:admin])
      @user.update_attribute(:editor, params[:user][:editor])
      @user.update_attribute(:login, params[:user][:login])

      if @user.update_attributes(params[:user])
        flash[:notice] = 'User profile successfully updated'
        redirect_to(:action => 'index')
      else
        render :action => :edit
      end
    end
	end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    render :root and return unless admin?
    @user = User.new(params[:user])
    @user.login = params[:user]['login']
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "User successfully created"
    else
      render :action => 'new'
    end
  end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :room_status
  
  layout :which_layout
  
  helper_method :mobile_device?
  
  def mobile_device?
    (request.user_agent =~ /(iPhone|iPod|Android|webOS|Mobile)/) && (request.user_agent !~    /iPad/)
  end
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :email
      devise_parameter_sanitizer.for(:sign_up) << :first_name
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:account_update) << :email
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:account_update) << :last_name
    end
    
    def room_status
      @status = RoomStatus.instance
    end
    
    def which_layout
      mobile_device? ? "mobile" : "application"
    end
    
    def user_is_logged_in?
      if current_user
        true
      else
        redirect_to new_user_session_url, :alert => "You must be signed in to access this page."
        false
      end
    end
    
    def user_is_editor?
      if user_is_logged_in?
        if current_user.editor? or current_user.admin?
          true
        else
          redirect_to root_url, :alert => "You do not have permission to access this page."
          false
        end
      end
    end
    
    def user_is_admin?
      if user_is_logged_in?
        if current_user.admin?
          true
        else
          redirect_to root_url, :alert => "You do not have permission to access this page."
          false
        end
      end
    end
end

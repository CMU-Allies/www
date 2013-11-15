module ApplicationHelper
  include ReCaptcha::ViewHelper
  
  def layout_title
    title = ""
    if ENV['RAILS_ENV'] == 'development'
      title = "DEVELOPMENT - "
    end
    
    title + "ALLIES@CMU"
  end
  
  def admin?
    user_signed_in? and current_user.admin?
  end
  
  def editor?
    user_signed_in? and (current_user.editor? or current_user.admin?)
  end
  
  def active?
    user_signed_in? and current_user.active?
  end
  
  def display_room_status
    status = RoomStatus.instance
    render partial: "shared/status", locals: { status: status }
  end
  
end

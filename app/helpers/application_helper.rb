module ApplicationHelper
  
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
    user_signed_in? and current_user.editor?
  end
  
  def active?
    user_signed_in? and current_user.active?
  end
  
  def user_level_options
    levels = 0..3
    levels.map do |level|
      fake_user = User.new
      fake_user.level = level
      [fake_user.user_level, level]
    end
  end
  
  def display_room_status
    status = RoomStatus.order("created_at DESC").limit(1).first
    if status.nil?
      ""
    else
      render partial: "shared/status", locals: { status: status }
    end
  end
  
end

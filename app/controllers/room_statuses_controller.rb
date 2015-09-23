class RoomStatusesController < ApplicationController
  before_filter :user_is_logged_in?
  
  def open
    status = RoomStatus.instance
    status.open = params[:open]
    status.user = current_user
    status.close_at_midnight = true
    status.save
    
    OfficeHourLog.create(:user => current_user, :is_open => params[:open])
    
    redirect_to root_url
  end
  
  def set_midnight
    status = RoomStatus.instance
    status.close_at_midnight = params[:midnight]
    status.user = current_user
    status.save
    
    redirect_to root_url
  end
end

class RoomStatusesController < ApplicationController
  def open
    status = RoomStatus.instance
    authorize! :update, status
    status.open = params[:open]
    status.user = current_user
    status.close_at_midnight = true
    status.save
    
    OfficeHourLog.create(:user => current_user, :is_open => params[:open])
    
    redirect_to root_url
  end
  
  def set_midnight
    status = RoomStatus.instance
    authorize! :update, status
    status.close_at_midnight = params[:midnight]
    status.user = current_user
    status.save
    
    redirect_to root_url
  end
end

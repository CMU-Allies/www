class RoomStatusesController < ApplicationController
  def open
    status = RoomStatus.instance
    authorize! :update, status
    status.open = true
    status.user = current_user
    status.save
    
    redirect_to root_url
  end
  
  def close
    status = RoomStatus.instance
    authorize! :update, status
    status.open = false
    status.user = current_user
    status.save
    
    redirect_to root_url
  end
end

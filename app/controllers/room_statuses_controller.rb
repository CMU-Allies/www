class RoomStatusesController < ApplicationController
  before_filter :user_is_logged_in?, only: [:open, :set_midnight]
  skip_before_filter :verify_authenticity_token, only: [:pi]
  
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

  def pi
    config = YAML.load_file(Rails.root.join('config', 'pi.yml'))
    if config[:password] == params[:password]
      status = RoomStatus.instance
      status.open = params[:open]
      status.save

      render :json => {status: "success"}
    else
      render :json => {status: "failure"}
    end
  end
end

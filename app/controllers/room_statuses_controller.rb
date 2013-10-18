class RoomStatusesController < ApplicationController
  def create
    @status = RoomStatus.new
    authorize! :create, @status
    
    @status.user = current_user
    @status.open = params[:status]
    @status.save
    
    redirect_to root_url
  end
end

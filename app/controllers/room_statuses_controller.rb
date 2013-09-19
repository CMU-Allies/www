class RoomStatusesController < ApplicationController
	before_filter :login_required
	def new
		@room_status = RoomStatus.new
	end

	def create
		@room_status = RoomStatus.new(params[:room_status])
		@room_status.user = @current_user

		if @room_status.save
			flash[:notice] = 'Room status successfully updated'
			redirect_to(:root)
		else
			render :action => 'new'
		end
	end

end

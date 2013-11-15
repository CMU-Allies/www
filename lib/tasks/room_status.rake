namespace :room_status do
  desc "Close SOHO at midnight"
  task :midnight => :environment do
    status = RoomStatus.instance
    
    if status.open
      if status.close_at_midnight
        status.open = false
      else
        status.close_at_midnight = true
      end
      
      status.save
    end
  end
end
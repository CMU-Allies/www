class RoomStatus < ActiveRecord::Base
  belongs_to :user
  
  def status
    if self.open
      :open
    else
      :closed
    end
  end
  
  rails_admin do
    base do
      configure :created_at do
        hide
      end
    end
  end
end

class RoomStatus < ApplicationRecord
  acts_as_singleton
  belongs_to :user
  
  def status
    if self.open
      :open
    else
      :closed
    end
  end
end

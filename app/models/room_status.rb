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

  def display_time
    updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a, %b %d %H:%M")
  end
end

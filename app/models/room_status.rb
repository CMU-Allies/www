class RoomStatus < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  # status of true means room is open, status of false means room is closed
  def self.latest
    self.last(:order => :created_at)
  end

  def to_s
    status ? 'open' : 'closed'
  end
end

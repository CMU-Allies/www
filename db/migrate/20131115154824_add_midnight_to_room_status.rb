class AddMidnightToRoomStatus < ActiveRecord::Migration
  def change
    add_column :room_statuses, :close_at_midnight, :boolean, :null => false, :default => true
  end
end

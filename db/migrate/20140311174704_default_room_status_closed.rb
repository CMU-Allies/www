class DefaultRoomStatusClosed < ActiveRecord::Migration
  def up
    change_column :room_statuses, :open, :boolean, :default => false, :null => false
  end
  
  def down
    change_column :room_statuses, :open, :boolean, :default => nil, :null => false
  end
end

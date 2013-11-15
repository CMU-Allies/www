class SingletonizeRoomStatus < ActiveRecord::Migration
  def up
    execute "DELETE FROM room_statuses WHERE id < " + RoomStatus.__send__(:maximum, :id).to_s
    change_column :room_statuses, :user_id, :integer, :null => true, :default => nil
  end
  
  def down
    change_column :room_statuses, :user_id, :integer, :null => false
  end
end

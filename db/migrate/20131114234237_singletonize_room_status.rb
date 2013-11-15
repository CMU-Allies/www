class SingletonizeRoomStatus < ActiveRecord::Migration
  def change
    execute "DELETE FROM room_statuses WHERE id < (SELECT id FROM room_statuses ORDER BY created_at DESC LIMIT 1)"
    change_column :room_statuses, :user_id, :integer, :null => true, :default => nil
  end
  
  def down
    change_column :room_statuses, :user_id, :integer, :null => false
  end
end

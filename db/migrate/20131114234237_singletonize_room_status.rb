class SingletonizeRoomStatus < ActiveRecord::Migration
  def up
    l = execute "SELECT id FROM room_statuses ORDER BY created_at DESC LIMIT 1"
    execute "DELETE FROM room_statuses WHERE id < " + l[0][0].to_s
    change_column :room_statuses, :user_id, :integer, :null => true, :default => nil
  end
  
  def down
    change_column :room_statuses, :user_id, :integer, :null => false
  end
end

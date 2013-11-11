class EnumerizeUserlevel < ActiveRecord::Migration
  def change
    add_column :users, :temp_level, :string, :null => false, :default => "inactive"
    
    reversible do |dir|
      dir.up do
        execute "UPDATE users SET temp_level = 'inactive' WHERE level = 0"
        execute "UPDATE users SET temp_level = 'trained' WHERE level = 1"
        execute "UPDATE users SET temp_level = 'editor' WHERE level = 2"
        execute "UPDATE users SET temp_level = 'admin' WHERE level = 3"
      end
      
      dir.down do
        execute "UPDATE users SET level = 0 WHERE temp_level = 'inactive'"
        execute "UPDATE users SET level = 1 WHERE temp_level = 'trained'"
        execute "UPDATE users SET level = 2 WHERE temp_level = 'editor'"
        execute "UPDATE users SET level = 3 WHERE temp_level = 'admin'"
      end
    end
    
    remove_column :users, :level, :integer, :default => 0, :null => false
    rename_column :users, :temp_level, :level
  end
end

class ConvertTablesToRealUnicode < ActiveRecord::Migration[5.0]
  def up
    change_column :pages, :slug, :string, limit: 191, null: false
    change_column :updates, :slug, :string, limit: 191, null: false
    change_column :users, :email, :string, limit: 191, null: false
    change_column :users, :login, :string, limit: 191, null: false
    change_column :users, :reset_password_token, :string, limit: 191

    execute "ALTER DATABASE " + ActiveRecord::Base.connection.current_database + " CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"

    models = [Commission, ExecBoard, OfficeHourLog, Officer, Page, RoomStatus, Update, User]
    models.each do |m|
      tn = m.table_name
      execute "ALTER TABLE " + tn + " CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"

      m.columns.each do |c|
        if /(text|varchar\([0-9]+\))/.match(c.sql_type)
          constraints = ""
          if !c.null
            constraints += " NOT NULL"
          end
          if !c.default.nil?
            constraints += " DEFAULT '" + c.default + "'"
          end
          execute "ALTER TABLE " + tn + " MODIFY " + c.name + " " + c.sql_type + " CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"  + constraints + ";"
        end
      end
    end

    execute "ALTER TABLE schema_migrations MODIFY version varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"
    execute "ALTER TABLE schema_migrations CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"

    execute "ALTER TABLE ar_internal_metadata MODIFY `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"
    execute "ALTER TABLE ar_internal_metadata MODIFY value varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"
    execute "ALTER TABLE ar_internal_metadata CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"

    ["commissions", "ar_internal_metadata", "exec_boards", "office_hour_logs", "officers", "pages", "room_statuses", "updates", "users", "schema_migrations"].each do |table|
      execute "REPAIR TABLE " + table + ";"
      execute "OPTIMIZE TABLE " + table + ";"
    end
  end

  def down
    execute "ALTER DATABASE " + ActiveRecord::Base.connection.current_database + " CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

    models = [Commission, ExecBoard, OfficeHourLog, Officer, Page, RoomStatus, Update, User]
    models.each do |m|
      tn = m.table_name
      execute "ALTER TABLE " + tn + " CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

      m.columns.each do |c|
        if /(text|varchar\([0-9]+\))/.match(c.sql_type)
          constraints = ""
          if !c.null
            constraints += " NOT NULL"
          end
          if !c.default.nil?
            constraints += " DEFAULT '" + c.default + "'"
          end
          execute "ALTER TABLE " + tn + " MODIFY " + c.name + " " + c.sql_type + " CHARACTER SET utf8 COLLATE utf8_unicode_ci" + constraints + ";"
        end
      end
    end

    execute "ALTER TABLE schema_migrations CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    execute "ALTER TABLE schema_migrations MODIFY version varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

    execute "ALTER TABLE ar_internal_metadata CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE ar_internal_metadata MODIFY `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE ar_internal_metadata MODIFY value varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci;"

    change_column :pages, :slug, :string, limit: 255, null: false
    change_column :updates, :slug, :string, limit: 255, null: false
    change_column :users, :email, :string, limit: 255, null: false
    change_column :users, :login, :string, limit: 255, null: false
    change_column :users, :reset_password_token, :string, limit: 255

    ["commissions", "ar_internal_metadata", "exec_boards", "office_hour_logs", "officers", "pages", "room_statuses", "updates", "users", "schema_migrations"].each do |table|
      execute "REPAIR TABLE " + table + ";"
      execute "OPTIMIZE TABLE " + table + ";"
    end
  end
end

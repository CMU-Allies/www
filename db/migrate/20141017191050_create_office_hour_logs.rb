class CreateOfficeHourLogs < ActiveRecord::Migration
  def change
    create_table :office_hour_logs do |t|
      t.references :user, index: true
      t.boolean :is_open

      t.timestamps
    end
  end
end

class CreateRoomStatuses < ActiveRecord::Migration
  def change
    create_table :room_statuses do |t|
      t.references :user,   null: false
      t.boolean :open,      null: false

      t.timestamps
    end
  end
end

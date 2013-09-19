class CreateRoomStatuses < ActiveRecord::Migration
  def change
    create_table :room_statuses do |t|
      t.boolean :status
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

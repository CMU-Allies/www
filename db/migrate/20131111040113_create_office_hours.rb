class CreateOfficeHours < ActiveRecord::Migration
  def change
    create_table :office_hours do |t|
      t.references :user, index: true, null: false
      t.string :day, null: false
      t.integer :starts, null: false
      t.integer :ends, null: false

      t.timestamps
    end
  end
end

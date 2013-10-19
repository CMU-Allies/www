class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end

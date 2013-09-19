class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :title
      t.integer :order
      t.belongs_to :user, index: true
      t.boolean :public
      t.boolean :email

      t.timestamps
    end
  end
end

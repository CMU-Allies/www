class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.text :synopsis
      t.string :category
      t.string :media_type
      t.boolean :checked_out
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

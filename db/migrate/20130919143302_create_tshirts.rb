class CreateTshirts < ActiveRecord::Migration
  def change
    create_table :tshirts do |t|
      t.string :name
      t.string :size
      t.boolean :available
      t.float :price

      t.timestamps
    end
  end
end

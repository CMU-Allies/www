class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.text :description
      t.decimal :price, null: false, default: 0.0

      t.timestamps null: false
    end
  end
end

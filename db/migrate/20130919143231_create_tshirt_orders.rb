class CreateTshirtOrders < ActiveRecord::Migration
  def change
    create_table :tshirt_orders do |t|
      t.string :name
      t.belongs_to :tshirt, index: true
      t.boolean :received
      t.boolean :paid
      t.integer :qty

      t.timestamps
    end
  end
end

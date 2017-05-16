class CreateOfficers < ActiveRecord::Migration[5.0]
  def change
    create_table :officers do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.references :exec_board, null: false

      t.timestamps
    end
  end
end

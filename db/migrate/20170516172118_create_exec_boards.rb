class CreateExecBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :exec_boards do |t|
      t.integer :year, null: false

      t.timestamps
    end
  end
end

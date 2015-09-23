class RemoveTypeFieldFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :type, :string
  end
end

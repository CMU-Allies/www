class RemoveResources < ActiveRecord::Migration
  def change
    drop_table :resource_categories
    drop_table :resources
  end
end

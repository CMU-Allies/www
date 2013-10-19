class CreateResources < ActiveRecord::Migration
  def change
    create_table :resource_categories do |t|
      t.string :title, null: false

      t.timestamps
    end
    
    create_table :resources do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.string :url
      t.references :resource_category, null: false

      t.timestamps
    end
  end
end

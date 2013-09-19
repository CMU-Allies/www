class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.text :text
      t.string :url
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end

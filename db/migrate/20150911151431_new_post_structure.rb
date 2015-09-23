class NewPostStructure < ActiveRecord::Migration
  def change
    drop_table :articles
    
    create_table :updates do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :body
      
      t.timestamps
    end
    
    create_table :pages do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.string :type
      t.text :body
      
      t.timestamps
    end
    
    add_index :updates, :slug, :unique => true
    add_index :pages, :slug, :unique => true
  end
end

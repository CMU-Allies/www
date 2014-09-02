class AddShowOnHomepageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :homepage, :boolean, :null => false
  end
end

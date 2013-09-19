class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end

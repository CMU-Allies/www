class RewriteStuff < ActiveRecord::Migration
  def change
    drop_table :news_feeds
    drop_table :office_hours
    drop_table :officers
    drop_table :rails_admin_histories
  end
end

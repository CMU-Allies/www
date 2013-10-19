class NewsController < ApplicationController
  
  def index
    @feeds = NewsFeed.all.collect { |x| x.title }.join ", "
    @items = NewsFeed.all.collect { |x| x.items }.flatten!
    @items.sort! do |x,y|
      y.pubDate <=> x.pubDate
    end
  end
  
end

require 'open-uri'
class NewsFeed < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  
  def items
    begin
      SimpleRSS.parse(open(self.url)).items
    rescue Exception
      []
    end
  end
  
end

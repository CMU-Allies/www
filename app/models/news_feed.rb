require 'rss'
class NewsFeed < ActiveRecord::Base

  def items
    begin
      RSS::Parser.parse(open(url).read, false).items
    rescue Exception
      [FakeItem.new]
    end
  end

  class FakeItem
    def date
      DateTime.now
    end

    def title
      "This feed is unavailable"
    end

    def link
      "#"
    end
  end
end

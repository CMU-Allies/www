class StaticController < ApplicationController
	def index
		article = Article.first(:conditions => { :topstory => true },
                                :order => 'created_at DESC')
    @articles = Article.all(:conditions => { :topstory => false },
                             :order => 'created_at DESC',
                             :limit => 5)
    @articles.unshift article if article

		@status = RoomStatus.latest
	end

	def about
    @officers = Officer.all(:order => '`order` ASC')
	end

	def calendar
	end
end

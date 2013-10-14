class ArticlesController < ApplicationController
  
  def home
    @articles = Article.order("created_at DESC").limit(5)
    
    respond_to do |format|
      format.html # home.html.haml
      format.xml  { render :xml => @articles }
    end
  end
  
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
    
    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @articles }
    end
  end
  
end

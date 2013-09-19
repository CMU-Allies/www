class ArticlesController < ApplicationController
	before_filter :login_required, :except => ['index','show']
	def authorized?
		editor?
	end
  @@def_params = { "topstory" => 0 }

  # GET /articles
  # GET /articles.xml
  def index
    p = { "limit" => 10, "offset" => 0 }
    p.update params if params
    limit = p["limit"].to_i
    offset = p["offset"].to_i

    @articles = Article.find(:all, :order => "created_at DESC",
    :limit => limit, :offset => offset)
    @next = offset + limit if (@articles.size == limit)
    @prev = offset - limit if (offset-limit >= 0)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

	# GET /articles/1
	def show
		@article = Article.find(params[:id])
	end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(@@def_params.merge params[:article])

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(@@def_params.merge params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end

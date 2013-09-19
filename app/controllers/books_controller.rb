class BooksController < ApplicationController
  before_filter :login_required, :except => ['index', 'show', 'search']
  def authorized?
    admin?
  end

  def index
    @books = Book.find(:all, :order => 'category, last_name, first_name')
  end

  def search
    @books = Book.find(:all, :conditions => Book.search_conditions(params['terms']), :order => 'category, last_name, first_name')
    render :action => 'index'
  end

  def show
    @book =  Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])

    if @book.save
      flash[:notice] = "Book successfully created"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      flash[:notice] = 'Book successfully updated'
      redirect_to @book
    else
      render :action => 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    flash[:notice] = 'Book was deleted'
    redirect_to books_url
  end
end

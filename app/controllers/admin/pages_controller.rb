class Admin::PagesController < ApplicationController
  before_action :user_is_editor?
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    
    if @page.save
      flash[:notice] = "Page created successfully."
      
      redirect_to admin_root_url
    else
      render :new
    end
  end
  
  def edit
    @page = Page.friendly.find(params[:id])
  end
  
  def update
    @page = Page.friendly.find(params[:id])
    
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
    end
    
    render :edit
  end
  
  def destroy
    @page = Page.friendly.find(params[:id])
    @page.destroy
    flash[:notice] = "Page deleted successfully."
    redirect_to admin_root_url
  end
  
  private
    def page_params
      params.require(:page).permit(:title, :body)
    end
end

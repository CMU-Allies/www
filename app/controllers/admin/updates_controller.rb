class Admin::UpdatesController < ApplicationController
  before_filter :user_is_editor?
  
  def index
    @updates = Update.all
  end
  
  def new
    @update = Update.new
  end
  
  def create
    @update = Update.new(update_params)
    
    if @update.save
      flash[:notice] = "Update created successfully."
      
      redirect_to admin_updates_url
    else
      render :new
    end
  end
  
  def edit
    @update = Update.friendly.find(params[:id])
  end
  
  def update
    @update = Update.friendly.find(params[:id])
    
    if @update.update_attributes(update_params)
      flash[:notice] = "Update updated successfully."
    end
    
    render :edit
  end
  
  def destroy
    @update = Update.friendly.find(params[:id])
    @update.destroy
    flash[:notice] = "Update deleted successfully."
    redirect_to admin_updates_url
  end
  
  private
    def update_params
      params.require(:update).permit(:title, :body)
    end
end

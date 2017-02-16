class Admin::CommissionsController < ApplicationController
  before_action :user_is_editor?

  def index
    @commissions = Commission.all
  end

  def new
    @commission = Commission.new
  end

  def create
    @commission = Commission.new(commission_params)
  
    if @commission.save
      flash[:notice] = "Commission created successfully."
    
      redirect_to admin_commissions_url
    else
      render :new
    end
  end

  def edit
    @commission = Commission.find(params[:id])
  end

  def update
    @commission = Commission.find(params[:id])
  
    if @commission.update_attributes(commission_params)
      flash[:notice] = "Commission updated successfully."
    end
  
    render :edit
  end

  def destroy
    @commission = Commission.find(params[:id])
    @commission.destroy
    flash[:notice] = "Commission deleted successfully."
    redirect_to admin_commissions_url
  end

  private
    def commission_params
      params.require(:commission).permit(:description, :price, :image)
    end
end

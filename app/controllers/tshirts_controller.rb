class TshirtsController < ApplicationController
  before_filter :login_required
  def authorized?
    admin?
  end

  def index
    @tshirts = Tshirt.all
  end

  def new
    @tshirt = Tshirt.new
  end

  def create
    @tshirt = Tshirt.new(params[:tshirt])
    if @tshirt.save
      flash[:notice] = 'T-Shirt successfully created'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @tshirt = Tshirt.find(params[:id])
  end

  def update
    @tshirt = Tshirt.find(params[:id])
    if @tshirt.update_attributes(params[:tshirt])
      flash[:notice] = 'T-Shirt successfully updated'
      redirect_to :action => 'show'
    else
      render :action => 'edit'
    end
  end

  def show
    @tshirt = Tshirt.find(params[:id])
  end

  def destroy
    @tshirt = Tshirt.find(params[:id])
    @tshirt.destroy
    redirect_to :action => 'index'
  end
end

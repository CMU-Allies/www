class TshirtOrdersController < ApplicationController
  before_filter :login_required, :except => [ :new, :create ]
  def authorized?
    admin?
  end

  def index
    @tshirt_orders = TshirtOrder.all
  end

  def new
    @tshirt_order = TshirtOrder.new
    @tshirts = Tshirt.available_shirts
  end

  def create
    @tshirt_order = TshirtOrder.new(params[:tshirt_order])
    if @tshirt_order.save
      flash[:notice] = 'T-Shirt order successfully saved'
      redirect_to :root
    else
      @tshirts = Tshirt.available_shirts
      render :action => 'new'
    end
  end

  def edit
    @tshirt_order = TshirtOrder.find(params[:id])
    @tshirts = Tshirt.available_shirts
  end

  def update
    @tshirt_order = TshirtOrder.find(params[:id])
    @tshirt_order.update_attribute(:received, params[:tshirt_order][:received])
    @tshirt_order.update_attribute(:paid, params[:tshirt_order][:paid])
    if @tshirt_order.update_attributes(params[:tshirt_order])
      flash[:notice] = 'T-Shirt order successfully updated'
      redirect_to :action => 'index'
    else
      @tshirts = Tshirt.available_shirts
      render :action => 'edit'
    end
  end

  def destroy
    @tshirt_order = TshirtOrder.find(params[:id])
    @tshirt_order.destroy
    redirect_to :action => 'index'
  end
end

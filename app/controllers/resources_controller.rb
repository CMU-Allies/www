class ResourcesController < ApplicationController
	before_filter :login_required, :except => ['index', 'show']
	def authorized?
		editor?
	end

  def index
		# WOW this is dumb. I should refactor this
		res = Resource.all
		@resources = Hash.new
		# collect resources into groups of the same category
		res.each do |r|
			if @resources[r.category]==nil
				@resources[r.category]=[r]
			else
				@resources[r.category].push r
			end
		end
  end

  def new
		@resource = Resource.new
		@categories = Category.all.collect {|c| [c.name, c.id] }
  end

	# GET /resources/1
	def show
		@resource = Resource.find(params[:id])
	end

	# GET /resources/1/edit
  def edit
		@resource = Resource.find(params[:id])
		@categories = Category.all.collect {|c| [c.name, c.id] }
  end

	# POST /resources
	def create
		@resource = Resource.new(params[:resource])
		if params[:category]['new_category']=='yes'
			category = Category.new
			category.name = params[:category]['name']
			# this is a rude kluge
			redirect_to(:action => 'new') and return unless category.save
	#		render :action => 'new' unless category.save
			@resource.category = category
			@resource.category_id = nil
		end

		if @resource.save
			flash[:notice] = 'Resource was successfully created.'
			redirect_to(:action => 'index')
		else
			@categories = Category.all.collect {|c| [c.name, c.id] }
			render :action => 'new'
		end
	end

	# PUT /resources/1
	def update 
		@resource = Resource.find(params[:id])

		if @resource.update_attributes(params[:resource])
			flash[:notice] = 'Resource was successfully updated.'
			redirect_to(:action => 'index')
		else
			render :action => 'edit'
		end
	end

	# DELETE /resources/1
	def destroy
		@resource = Resource.find(params[:id])
		category = @resource.destroy.category
		category.destroy if category.resources.size==0
		flash[:notice] = 'Resource successfully deleted'
		redirect_to(:action => 'index')
	end

end

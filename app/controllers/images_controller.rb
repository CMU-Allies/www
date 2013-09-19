class ImagesController < ApplicationController
  before_filter :login_required, :except => ['show']
  def authorized?
  	admin?
  end

  # GET /images
  # GET /images.xml
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @image = Image.find(params[:id])
    redirect_to @image.image.url if params.key? :full
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @image = Image.new
    @galleries = Gallery.all.map {|g| [g.name, g.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    gallery = nil
    @image = Image.new(params[:image])
    if params[:gallery][:new_gallery] == 'yes'
      gallery = Gallery.new
      gallery.name = params[:gallery][:name]
      redirect_to(:action => 'new') and return unless gallery.save
      @image.gallery = gallery
      @image.gallery_id = nil
    end

    respond_to do |format|
      if @image.save
        @image.gallery.cover_image = @image
        @image.gallery.save
        flash[:notice] = 'Image was successfully created.'
        format.html { redirect_to(@image) }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        @galleries = Gallery.all.map {|g| [g.name, g.id] }
        gallery.destroy unless gallery.nil?
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(@image) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_back_or_default(galleries_url) }
      format.xml  { head :ok }
    end
  end
end

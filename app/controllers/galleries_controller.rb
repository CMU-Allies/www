class GalleriesController < ApplicationController
  before_filter :login_required, :except => ['index', 'show']
  def authorized?
  	admin?
  end

  #GET /galleries
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

	def new
		@gallery = Gallery.new
	end

	def create
    @uploaded_file = params[:gallery][:zipfile]
    params[:gallery].delete(:zipfile)
    @gallery = Gallery.new(params[:gallery])

    if @uploaded_file == nil
      flash[:notice] = "No file selected"
      render(:action => 'new')
      return
    end
    unless @gallery.save
      render(:action => 'new')
      return
    end
    
    order = 0
    begin
      zipfile = ::Zip::ZipFile.open(@uploaded_file.path)
    rescue Exception
      Gallery.delete(@gallery.id)
      flash[:notice] = 'No images found'
      render(:action => 'new')
      return
    end
    zipfile.each do |file|
      next unless file.file?
      tmpfilename = DateTime.now.to_s + rand(100000).to_s
      file.extract("/tmp/#{tmpfilename}")
 
      @image = Image.new
      @image.image = File.open("/tmp/#{tmpfilename}")
      @image.gallery = @gallery
      @image.order = order
      File.delete("/tmp/#{tmpfilename}")
      order += 1 if @image.save
    end
    if @gallery.images.size < 1
      Gallery.delete(@gallery.id)
      flash[:notice] = 'No images found'
      render(:action => 'new')
      return
    else
      @gallery.cover_image = @gallery.images[0]
      @gallery.save
      p @gallery
    end
    flash[:notice] = 'Successfully created gallery'
    redirect_to(:action => 'index')
	end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    params[:image].each do |img_id,order|
      image = Image.find(img_id)
      next if image.nil?
      image.order = order
      image.save
    end

    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = 'Gallery successfully updated';
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.images.each do |image|
      image.destroy
    end
    # when the last image is destroyed, it will delete the gallery
    redirect_to galleries_url
  end
end

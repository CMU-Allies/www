class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :image, :styles => { :thumb => '96x96#', :medium => '640x480>', :path => ":rails_root/public/system/:attachment/:id/:style/:filename", :url => "/system/:attachment/:id/:style/:filename"}
  validates :order, presence: true
  validates :gallery, presence: true

  before_destroy :update_gallery

  def update_gallery
    return unless self.gallery
    images = self.gallery.images
    images.delete self
    if images.size == 0
      self.gallery.destroy
      return
    end
    self.gallery.cover_image = images[0] if self.gallery.cover_image == self
    self.gallery.save
  end

  def index
    return self.gallery.images.index(self)
  end

  def next
    index == self.gallery.images.size ? nil : self.gallery.images[index + 1]
  end

  def prev
    index == 0 ? nil : self.gallery.images[index - 1]
  end
end

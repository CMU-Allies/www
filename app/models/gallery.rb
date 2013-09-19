class Gallery < ActiveRecord::Base
  validates :name, :presence: true

  has_many :images, :order => '`order` ASC'
  belongs_to :cover_image, :class_name => "Image"
end

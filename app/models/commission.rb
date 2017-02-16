class Commission < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :image, attachment_presence: true
  
  validates_presence_of :description, :price
end

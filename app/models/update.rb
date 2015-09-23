class Update < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :body, :presence => true
end

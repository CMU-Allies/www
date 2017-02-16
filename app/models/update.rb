class Update < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, :body, :presence => true
end

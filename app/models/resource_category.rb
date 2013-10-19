class ResourceCategory < ActiveRecord::Base
  has_many :resources
  
  validates :title, presence: true
  
  rails_admin do
    list do
      configure :created_at do
        hide
      end
      
      configure :updated_at do
        hide
      end
    end
  end
end

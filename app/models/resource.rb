class Resource < ActiveRecord::Base
  belongs_to :resource_category
  
  validates :title, presence: true
  validates :text, presence: true
  validates :resource_category, presence: true
  
  rails_admin do
    base do
      configure :resource_category do
        label "Category"
      end
    end
    
    list do
      field :title
      field :text
      field :url
      field :resource_category
    end
    
    edit do
      configure :text, :wysihtml5
    end
  end
end

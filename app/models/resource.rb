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
      field :text do
        formatted_value do
          bindings[:object].text.gsub(/<[^>]*>/ui,' ')
        end
      end
      field :url
      field :resource_category
    end
    
    edit do
      configure :text, :wysihtml5
    end
    
    show do
      configure :text do
        formatted_value do
          bindings[:object].text.gsub(/<[^>]*>/ui,' ')
        end
      end
      
      configure :url do
        formatted_value do
          ("<a href=\"" + bindings[:object].url + "\">" + bindings[:object].url + "</a>").html_safe
        end
      end
    end
  end
end

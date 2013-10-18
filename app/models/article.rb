class Article < ActiveRecord::Base
  validates :title, :body, presence: true
  
  rails_admin do
    edit do
      field :title
      field :body, :wysihtml5
    end
  end
end

class Article < ActiveRecord::Base
  validates :title, :body, presence: true
  
  rails_admin do
    edit do
      field :title
      field :body
      field :homepage do
        label "Show on homepage?"
      end
    end
  end
end

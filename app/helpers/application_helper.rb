module ApplicationHelper
  
  def layout_title
    title = ""
    if ENV['RAILS_ENV'] == 'development'
      title = "DEVELOPMENT - "
    end
    
    title + "ALLIES@CMU"
  end
  
end

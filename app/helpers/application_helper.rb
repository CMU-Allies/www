module ApplicationHelper
  def layout_title
    title = ""
    if ENV['RAILS_ENV'] == 'development'
      title = "DEVELOPMENT - "
    end
    
    title += "CMU ALLIES"
    
    if @title
      title += " - " + @title
    end
    
    title
  end
  
  def admin?
    user_signed_in? and current_user.admin?
  end
  
  def editor?
    user_signed_in? and (current_user.editor? or current_user.admin?)
  end
  
  def active?
    user_signed_in? and current_user.active?
  end
  
  def display_error_messages(model)
    return "" if model.errors.empty?
    
    messages = model.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = "<div id=\"error_explanation\">\n<ul>#{messages}</ul>\n</div>\n"

    html.html_safe
  end
  
end

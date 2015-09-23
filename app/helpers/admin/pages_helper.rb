module Admin::PagesHelper
  
  def link_to_admin_tab(name, options = {}, tab, current)
    if tab == current
      link_to name, options, class: 'active'
    else
      link_to name, options
    end
  end
  
end

module ApplicationHelper
  include ReCaptcha::ViewHelper
  def editor?
    logged_in? && current_user.editor
  end

  def admin?
    logged_in? && current_user.admin
  end
end

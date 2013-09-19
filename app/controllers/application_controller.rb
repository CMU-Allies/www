class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include ReCaptcha::AppHelper
  layout 'main'

  Time.zone = "Eastern Time (US & Canada)"

  protect_from_forgery

  protected
  def editor?
    logged_in? && current_user.editor
  end

  def admin?
    logged_in? && current_user.admin
  end
end

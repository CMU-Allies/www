class WelcomeController < ApplicationController
  def index
    @snippet = Page.friendly.find("about-snippet")
    @update = Update.order(created_at: :desc).first
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
  end
end

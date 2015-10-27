class CommissionsController < ApplicationController
  def index
    @commissions = Commission.order(created_at: :desc)
    @page = Page.friendly.find("prideful-garment-commissions")
    @title = @page.title
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
  end
end

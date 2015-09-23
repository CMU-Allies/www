class PagesController < ApplicationController
  def show
    @page = Page.friendly.find(params[:id])
    @title = @page.title
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
  end
end

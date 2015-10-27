class PagesController < ApplicationController
  def show
    if params[:id] == "prideful-garment-commissions"
      redirect_to commissions_url
    end
    
    @page = Page.friendly.find(params[:id])
    @title = @page.title
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
  end
end

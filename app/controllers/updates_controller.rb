class UpdatesController < ApplicationController
  def index
    @updates = Update.all
    @title = "Update History"
  end

  def show
    @update = Update.friendly.find(params[:id])
    @title = @update.title
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
  end
end

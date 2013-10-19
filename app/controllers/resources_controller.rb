class ResourcesController < ApplicationController
  
  def index
    @categories = ResourceCategory.all
  end
  
end

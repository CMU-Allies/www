class StaticController < ApplicationController
  def about
    @officers = Officer.order("`order` ASC").to_a
  end

  def calendar
  end
end

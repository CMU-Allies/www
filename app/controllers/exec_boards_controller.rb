class ExecBoardsController < ApplicationController
  
  def index
    @current = ExecBoard.order(year: :desc).first
    @exec_boards = ExecBoard.where("year < ?", @current.year).order(year: :desc).all
  end
  
end

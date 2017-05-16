class Admin::ExecBoardsController < ApplicationController
  before_action :user_is_editor?

  def index
    @exec_boards = ExecBoard.order(year: :desc).all
  end

  def new
    @exec_board = ExecBoard.new

    Officer::Officers_All.each do |officer|
      @exec_board.officers.build(position: officer, present: true)
    end
  end

  def create
    @exec_board = ExecBoard.new(exec_board_params)

    if @exec_board.save
      flash[:notice] = "Exec Board created successfully."

      redirect_to admin_exec_boards_url
    else
      complete_board

      render :new
    end
  end

  def edit
    @exec_board = ExecBoard.friendly.find(params[:id])

    complete_board
  end

  def update
    @exec_board = ExecBoard.friendly.find(params[:id])

    if @exec_board.update_attributes(exec_board_params)
      flash[:notice] = "Exec board updated successfully."
    end

    complete_board

    render :edit
  end

  def destroy
    @exec_board = ExecBoard.friendly.find(params[:id])
    @exec_board.destroy
    flash[:notice] = "Exec board deleted successfully."
    redirect_to admin_exec_boards_url
  end

  private
    def exec_board_params
      params.require(:exec_board).permit(:year, :officers_attributes => [:id, :position, :name, :present, :_destroy])
    end

    def complete_board
      present_officers = []
      @exec_board.officers.each do |officer|
        officer.present = true
        present_officers << officer.position
      end

      Officer::Officers_All.each do |officer|
        unless present_officers.include? officer
          @exec_board.officers.build(position: officer, present: false)
        end
      end
    end
end

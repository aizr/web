class Admin::BoardsController < ApplicationController
  layout "admin"
  before_filter :require_is_admin
  
  def index
    @boards = Board.recent.paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @board = Board.new
  end
    
  def edit
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(params[:board])
    
    respond_to do |format|
      if @board.save
        format.html { redirect_to board_path(@board), :notice => "Board was successfully created."}
      end
    end
  end
  
  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])
    
    respond_to do |format|
      format.html { redirect_to(board_path, :notice => "Board was successfully updated.") }
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_boards_url }
    end
  end
end

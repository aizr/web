class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    @posts = @board.posts
    
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @boards = Board.all
    
    respond_to do |format|
      format.html
    end
  end
  
  end

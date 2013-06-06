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
  
  def new
    @board = Board.new
  end
    
  def edit
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(params[:board])
    
    if @board.save
      respond_to do |format|
      format.html { redirect_to :action => :index }
      end
    end
  end
  
  def update
    @board = Board.find(params[:id])
    
    respond_to do |format|
      if @board.update_attributes(params[:post])
        format.html { redirect_to(@boards) }
      end
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    
    respond_to do |format|
      format.html { redirect_to(boards_url) }
      end
    end
  end

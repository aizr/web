class PostsController < ApplicationController
  
  def index
    @board = Board.find(params[:board_id])
    redirect_to board_path(@board)
  end
  
  def show
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])
  end
  
  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.build      
  end
  
  def edit
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])
  end
  
  def create
    @board = Board.find(params[:board_id])
    @post = @board.posts.build(params[:post])
    
    respond_to do |format|
      if @post.save
      format.html { redirect_to board_posts_path(@board), :notice => 'Post was successfully updated.' }
    end
   end
  end
  
  def update
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])
    
    if @post.upate_attributes (params[:post])
    respond_to do |format|
      format.html { redirect_to board_post_path(@board,@post), :notice => 'Post was successfully updated.' }
    end
  end
  end
  
  def destroy
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to board_posts_path(@board,@post) }
    end
  end
       
end

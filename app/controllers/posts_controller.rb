class PostsController < ApplicationController
  before_filter :find_board
  before_filter :authenticate_user!, :except => [ :show, :index ]
  def index
    redirect_to board_path(@board)
  end
  
  def show
    @post = @board.posts.find(params[:id])
  end
  
  def new
    @post = @board.posts.build      
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def create
    @post = @board.posts.build(params[:post])
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to board_posts_path(@board), :notice => 'Post was successfully updated.' }
      end
    end
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to board_post_path(@board,@post), :notice => 'Post was successfully updated.' }
      end
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to board_posts_path(@board,@post) }
    end
  end
  
  protected
  def find_board
    @board = Board.find(params[:board_id])
  end
       
end

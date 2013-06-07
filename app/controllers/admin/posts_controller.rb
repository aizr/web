class Admin::PostsController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  before_filter :find_board
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    
    respond_to do |format|
        format.html { redirect_to board_post_path(@board,@post), :notice => 'Post was successfully updated.' }
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
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

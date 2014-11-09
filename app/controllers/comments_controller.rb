class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:comment))
      @comment.user = current_user
      if @comment.save
        flash[:notice] = 'Comment successfully posted'
      else @comment.delete
        flash[:alert] = 'You have already commented on this post'
      end
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:alert] = 'Not your comment'
    end
    redirect_to '/'
  end

end

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
        flash[:notice] = 'You have already commented on this post'
      end
    redirect_to '/'
  end

end

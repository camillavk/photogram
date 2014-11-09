class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    # @comment = Comment.find(params[:comment_id])
    # @comment.likes.create
    # p @comment.likes.count
    render json: {new_likes_count: @post.likes.count}
  end

end

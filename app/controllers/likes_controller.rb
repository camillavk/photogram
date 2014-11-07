class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create
    # p @comment.likes.count
    render json: {new_likes_count: @comment.likes.count}
  end

end

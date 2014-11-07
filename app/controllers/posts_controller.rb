class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:caption, :image))
    # @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post successfully saved'
    end
    redirect_to '/'
  end


end

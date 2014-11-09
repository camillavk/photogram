class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:caption, :image))
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post successfully saved'
    else @post.delete
    end
    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Not your post'
    redirect_to '/'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:caption, :image))
    redirect_to '/'
  end

  def destroy
    @post = current_user.posts.find(params[:id])
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
    redirect_to '/'
  end

end

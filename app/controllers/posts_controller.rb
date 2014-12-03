class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:caption, :image, :price))
    @post.user_id = current_user.id
    flash[:notice] = 'Post successfully saved' if @post.save
    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    begin
      @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Not your post'
    end
    redirect_to '/'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:caption, :image, :price))
    redirect_to '/'
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/'
  end

end

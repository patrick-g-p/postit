class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
  end

  def edit

  end

  def update

  end

  private

  def post_params
    post.require(:post).permit(:title, :url, :description)
  end
end

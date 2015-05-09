class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was submitted."
      redirect_to @post
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

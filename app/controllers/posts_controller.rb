class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update] #:destroy not included for now.
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Post was submitted."
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated."
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  # def destroy
  #   @post.delete
  #
  #   redirect_to post_path
  # end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids:[])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

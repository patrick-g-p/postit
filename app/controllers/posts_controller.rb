class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update] #:destroy not included for now.

  def index
    @posts = Post.find(:all, order: 'created_at DESC')
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first #Change once you get to authentication

    if @post.save
      flash[:notice] = "Post was submitted."
      redirect_to @post
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  # def destroy
  #   @post.delete
  #
  #   redirect_to post_path
  # end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

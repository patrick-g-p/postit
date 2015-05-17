class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote] #:destroy not included for now.
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @posts = Post.all.sort_by{|post| post.total_number_of_votes}.reverse
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

  def vote
    vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html {redirect_to :back, flash[:notice] = "Vote was submitted"}
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids:[])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_same_user
    unless current_user == @post.creator
      flash[:error] = "You don't have permission to perform that action"
      redirect_to root_path
    end
  end
end

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end
end

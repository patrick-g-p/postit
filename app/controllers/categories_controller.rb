class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was created."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

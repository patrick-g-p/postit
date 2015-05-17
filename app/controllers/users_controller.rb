class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created sucessfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

    if @user.update(user_params)
      flash[:notice] = "Your information was updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find_by(slug: params[:id])
  end

  def require_same_user
    unless current_user == @user
      flash[:error] = "You don't have permission to perform that action"
      redirect_to root_path
    end
  end
end

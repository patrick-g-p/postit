class UsersController < ApplicationController
  # before_action :require_user, only: [:edit, :update]

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

  # def show
  #   @user = current_user
  # end

  # def edit
  #   @user = current_user
  # end
  #
  # def update
  #   @user = current_user
  #
  #   if @user.update
  #     flash[:notice] = "Your information was updated"
  #     redirect_to root_path
  #   else
  #     render 'edit'
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

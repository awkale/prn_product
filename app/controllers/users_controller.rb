class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    user_params = params.require(:user).permit(:first_name, :last_name)
    @user.update_attributes(user_params)

    redirect_to user_path(id: @user.id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end

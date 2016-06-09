class UsersController < ApplicationController
  before_action :find_user, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)

    redirect_to user_path(id: @user.id)
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end

class UsersController < ApplicationController
  before_action :find_user, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    if current_user.admin?
      if params[:limit]
        @users = User.order(:email).page(params[:page]).per(params[:limit])
      else
        @users = User.order(:email).page(params[:page])
      end
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.admin?
      if @user.update_attributes(user_params)
        redirect_to user_path(id: @user.id), notice: "Successfully updated user."
      else
        render :edit
      end
    else
      redirect_to users_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy

      redirect_to users_path, notice: "Successfully deleted user."
    else
      redirect_to users_path, alert: "You do not have permission."
    end
  end

  private
  def find_user
    @user = User.friendly.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin, :remember_me)
  end

end

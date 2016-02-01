class AdminsController < ApplicationController

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :god_mode, :read_only)

  end

end

class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin_super? || @current_user.admin_adv? || @current_user.admin?
  end

  def show?
    @current_user.admin_super? || @current_user.admin_adv? || @current_user.admin? || @current_user == @user
  end

  def update?
    @current_user.admin_super?
  end

  def edit?
    update?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin_super?
  end

end
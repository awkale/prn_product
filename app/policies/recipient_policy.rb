class RecipientPolicy < ApplicationPolicy
  def index?
    user.admin_super? || user.admin_adv? || user.admin? || user.user_internal? || user.customer_adv?
  end

  def update?
    user.admin_super? || user.admin_adv? || user.admin?
  end

  def create?
    user.admin_super? || user.admin_adv? || user.admin? || user.user_internal?
  end
end
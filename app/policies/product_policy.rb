class ProductPolicy < ApplicationPolicy
  def index?
    user.admin_super? || user.admin_adv? || user.admin? || user.user_internal? || user.customer_adv?
  end
end
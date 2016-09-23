class UserPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def show
    @current_user.admin? or @current_user == @user
  end

  def update?
    return true if user.present? && user.admin?
  end

  def destroy?
    return false if @current_user == @user
    user.present? && user.admin?
  end

end
# class ApplicationPolicy
#   attr_reader :user, :record

#   def initialize(user, record)
#     @user = user
#     @record = record
#   end

#   def index?
#     false
#   end

#   def show?
#     scope.where(:id => record.id).exists?
#   end

#   def create?
#     false
#   end

#   def new?
#     create?
#   end

#   def update?
#     false
#   end

#   def edit?
#     update?
#   end

#   def destroy?
#     false
#   end

#   def scope
#     Pundit.policy_scope!(user, record.class)
#   end

#   class Scope
#     attr_reader :user, :scope

#     def initialize(user, scope)
#       @user = user
#       @scope = scope
#     end

#     def resolve
#       scope
#     end
#   end
# end

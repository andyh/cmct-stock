class UserPolicy < ApplicationPolicy
  %i(index? create? new? update? edit? destroy?).each do |action|
    define_method(action) { admin? }
  end

  def show?
    admin? and scope.where(id: record.id).exists?
  end

  private
  def admin?
    user.has_role?(:admin)
  end

end

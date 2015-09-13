class ProductPolicy < ApplicationPolicy
  %i(index? create? new? update? edit? destroy?).each do |action|
    define_method(action) { admin? }
  end

  private
  def admin?
    user.has_role?(:admin)
  end

end

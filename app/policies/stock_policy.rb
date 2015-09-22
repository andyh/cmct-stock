class StockPolicy < ApplicationPolicy
  %i(index? create? new?).each do |action|
    define_method(action) { user.present? }
  end
end

class DashboardController < AuthenticatedController

  def index
    authorize :dashboard, :show?
    @stock_amount = current_user.stock.map do |item|
      item.product.price * item.quantity
    end.sum
  end
end

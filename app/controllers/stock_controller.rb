class StockController < AuthenticatedController
  before_action :authorize_resource

  def new
    @stock = AddStockForm.new
  end

  def create
    # TODO accept single product/quantity and process it to update stock table
    # new form uses ajax to add one row at a time and build up list
    # destroy could then remove quantity just added by reversing it
    @stock = AddStockForm.new(params[:add_stock_form])
    result = AddProductToStock.call(new_stock_item: @stock, user: current_user)
    if result.success?
      redirect_to new_stock_path
    else
      flash.now.alert = t(result.message)
      render :new
    end
  end

  private
  def resource
    @stock || Stock
  end
end

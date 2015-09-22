class AddProductToStock
  include Interactor

  delegate :user, to: :context
  delegate :new_stock_item, to: :context

  def call
    context.fail!(message: "add_product_to_stock.invalid_form") unless new_stock_item.valid?
    inventory = user.stock.find_or_create_by(product_id: new_stock_item.product_id)
    inventory.quantity = inventory.quantity + new_stock_item.quantity
    inventory.save!

  rescue ActiveRecord::RecordInvalid
    context.fail!(message: "add_product_to_stock.failure")
  end
end

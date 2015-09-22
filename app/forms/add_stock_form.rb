class AddStockForm
  include Virtus.model
  include ActiveModel::Model

  attribute :product_id, Integer
  attribute :quantity, Integer, default: 1

  validates :quantity, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :product_id, presence: true
end

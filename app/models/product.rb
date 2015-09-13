class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  delegate :name, to: :brand, prefix: true
  delegate :name, to: :category, prefix: true

  validates :name, :brand, :category, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
end

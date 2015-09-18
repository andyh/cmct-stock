class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
      t.integer :quantity, default: 0, null: false

      t.timestamps null: false
    end
  end
end

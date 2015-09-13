class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,         default: "",   null: false
      t.belongs_to :brand,    index: true,   foreign_key: true, null: false
      t.belongs_to :category, index: true,   foreign_key: true, null: false
      t.string :size,         default: ""
      t.text :description,    default: ""
      t.decimal :price,       default: 0.00, null: false,       precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end

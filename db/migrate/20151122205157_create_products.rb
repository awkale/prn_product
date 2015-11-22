class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :code
      t.integer :base_price
      t.integer :length_price

      t.timestamps null: false
    end
  end
end
